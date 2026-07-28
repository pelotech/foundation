# Gateway API Adoption

The platform supports **both the Ingress API and the Gateway API for the
foreseeable future**: Ingress is served by the [`traefik`
component](../gitops/components/traefik/README.md) (nginx-compatible,
replacing the retired ingress-nginx controller), and the Gateway API by the
[`envoy-gateway` component](../gitops/components/envoy-gateway/). Moving an
application from Ingress to Gateway API is **optional and per-app** — this
document covers enabling the Gateway API stack on a cluster and, for apps that
want it, the cutover choreography.

> ⚠️ **Maturity: switch cautiously.** While the Gateway API resources this
> platform uses (`Gateway`, `HTTPRoute`, `ListenerSet`) are GA in the spec,
> key integrations are still **beta**: cert-manager's Gateway support is
> officially a beta feature (its `ListenerSet` support only since `v1.20`,
> gated behind feature flags), and external-dns's TLS/TCP/UDP route sources
> ride deprecated alpha APIs. Ingress remains the battle-tested default path.
> Move apps one at a time, keep the weighted-DNS rollback in place until a
> host has proven itself, and treat certificate issuance and DNS record
> creation as the things to verify — they cross the beta surfaces.

## Initial Per-Cluster Steps

Each numbered step should be a discrete PR.

1. In the `infrastructure` `AppProject` (`_base/resources.yaml`) add the following to `spec.destinations`:

``` yaml
    - namespace: envoy-gateway-system
      server: https://kubernetes.default.svc
```

In Argo (`argocd` application), check the  `infrastructure` `AppProject` is healthy and updated.

2. Install Envoy Gateway
    * In `kustomization.yaml`, add `https://github.com/pelotech/foundation//gitops/components/envoy-gateway?ref=v4.3.3` to the `components` array, replacing the version with the current version. **Order matters**: list it *after* the `cert-manager` and `external-dns` components — the envoy-gateway component patches both, and kustomize silently skips patches whose targets aren't accumulated yet
    * In `_base/environment.yaml` add `EG_NLB_NAME: "eg-CLUSTER-NAME"` (subbing in your `CLUSTER-NAME`, e.g. `eg-foundation-nonprod`) to the `kustomize-environment` `ConfigMap`
    * In `rbac.yaml` in the `viewonly-access` `ClusterRole`, add the following values to the `rules.apiGroups` array:

``` yaml
      - gateway.envoyproxy.io
      - gateway.networking.k8s.io
```

In Argo (`argocd` application), ensure your `GatewayClass` and `EnvoyProxy` objects exist and are healthy. You may also want to check the updated `ConfigMap` and `ClusterRole`.

3. Verify the Gateway API stack (no manual controller changes are needed)

The `Gateway` itself (name `eg`, namespace `envoy-gateway-system`) is created
**automatically** by the component's `create-gateway` chart, including an
`acme-solver` listener on port 80 for the Let's Encrypt http01 solver. No
per-cluster Gateway YAML is needed.

#### Gateway Certificate Challenge (ACME Solver)

The `acme-solver` listener is on by default. If a cluster must not expose port
80 (e.g. dns01-only), disable it by patching the `envoy-gateway` Application's
`create-gateway` source values with `gateway.acmeSolver: false` — a
placeholder listener is rendered instead (a Gateway currently requires at
least one listener; see
[gateway-api#4425](https://github.com/kubernetes-sigs/gateway-api/issues/4425)).
Extra cluster-level listeners can be added via `gateway.extraListeners`;
per-host TLS should use `ListenerSets`.

* cert-manager's Gateway API + ListenerSet support and external-dns's Gateway
  API route sources (`gateway-httproute`, `gateway-grpcroute`,
  `gateway-tlsroute`, `gateway-tcproute`, `gateway-udproute`, with ListenerSet
  traversal) are enabled **automatically** by the envoy-gateway component — no
  cert-manager or external-dns patches are needed. **Ordering matters**: the
  cert-manager and external-dns components must be listed *before*
  `envoy-gateway` in your `components:` array; if one is missing or listed
  after, kustomize silently skips that patch — gateway certificates won't
  issue / gateway DNS records won't publish. Notes: TCP/UDP routes carry no
  hostnames, so their records require the
  `external-dns.alpha.kubernetes.io/hostname` annotation on the route; the
  external-dns patch replaces the whole `sources` list, so clusters with
  custom sources should re-patch the full list after the component.

In Argo (`envoy-gateway` application), ensure your `Gateway` object exists and is healthy. You may also want to check the `cert-manager` and `external-dns` applications.

In AWS, in the EC2 page, ensure your new load balancer exists. If you have a `Listener` on port 80 for Let's Encrypt, you can ensure a `Listener` exists with at least one `Healthy` `Target Group` (it is OK to have unhealthy `Target Groups` as long as one is healthy).

## Namespaces/Application Steps

Using Helm, you can create [HTTPRoutes](https://gateway-api.sigs.k8s.io/api-types/httproute/) and [ListenerSets](https://gateway-api.sigs.k8s.io/guides/listener-set/) per hostname. This is a preferred pattern instead of needing to define hostnames at the Gateway level AND HTTPRoute level. This allows application developers to create hostnames without touching Cluster level resources (i.e. Gateway). See more info from the [Gateway Introduction docs](https://gateway-api.sigs.k8s.io/).

You may want to use [weighted routing](#external-dns-annotations) to ensure a clean cutover from `Ingress` to `Gateway`. Without weighted routing, deleting old `Ingress` objects may be required to flip traffic.

See the Pelotech [LRSQL Chart](https://github.com/pelotech/charts/tree/main/charts/lrsql) for an example.

Once you have created your `ListenerSets` and `HTTPRoutes`, in AWS, in the EC2 page, ensure your load balancer has a `Listener` on the correct port (probably `443`) with at least one `Healthy` `Target Group` (it is OK to have unhealthy `Target Groups` as long as one is healthy).

In Argo, ensure your new `ListenerSets` and `HTTPRoutes` are healthy.

You can check your new routes (without flipping weight) by editing your hosts file. See [EG Migration Tester](https://github.com/apkatsikas/eg-migration-tester#local-testing-via-etchosts) docs for more info.

### HTTPRoute and ListenerSet annotations

#### Cert Manager Annotations

Use the following annotations on `ListenerSets` when using Cert Manager with Let's Encrypt:

* `acme.cert-manager.io/http01-parentreffallback: "true"` - requires cert-manager `v1.21+` (the cert-manager component ships `v1.21.0`)
* `cert-manager.io/cluster-issuer: letsencrypt`

If the ClusterIssuer defines a labeled gateway solver (see the
[create-issuer README](https://github.com/pelotech/foundation/blob/main/gitops/components/cert-manager/create-issuer/README.md)),
also add the matching **label** (not annotation) so Certificates created from
the ListenerSet select the gateway solver instead of the default Ingress
solver:

* `use-gateway-solver: "true"` — Certificates inherit labels from the
  annotated ListenerSet/Gateway, and cert-manager picks solvers by label
  match, never by which controller requested the cert.

#### External DNS Annotations

Use the following annotations on `HTTPRoutes` when using AWS Route53 and Weighted Routing:

* `external-dns.alpha.kubernetes.io/aws-weight: "0"`
* `external-dns.alpha.kubernetes.io/set-identifier: unique-name` (be sure to use a real unique name and not `unique-name`)

Placement matters: these must be on the **Route** (or `Ingress`) object, never
the `Gateway` — external-dns reads only the `target` annotation from Gateway
objects and silently ignores routing-policy annotations placed there
([a documented common mistake](https://kubernetes-sigs.github.io/external-dns/v0.21.0/docs/annotations/annotations/)).

#### Certificates During Weighted Cutover (use dns01)

**http01 does not work reliably while a host's DNS is split between two data
planes.** Let's Encrypt validates from multiple network vantage points
([Multi-Perspective Issuance Corroboration](https://letsencrypt.org/2025/02/20/first-mpic-request/),
mandatory for all CAs since 2025), and each vantage point resolves DNS
independently — under a weighted split they land on different NLBs, but
cert-manager presents each challenge through only one solver/data plane, so
the corroboration quorum fails. There is also a chicken-and-egg at weight `0`:
Route53 never returns a zero-weight record, so the ListenerSet's new
Certificate (a separate cert/secret from the Ingress-side one) cannot issue
via http01 *before* traffic shifts — you would cut over to a listener with no
certificate.

The supported pattern is the **dns01 solver**, which is independent of where
traffic lands:

1. When creating the `ListenerSet`, add the label
   `use-dns01-solver: "true"` (alongside the `cert-manager.io/cluster-issuer`
   annotation). The Certificate inherits the label and issues via Route53
   immediately — at weight `0`, before any traffic moves.
2. Verify the certificate is issued and the AWS listener healthy, then start
   shifting weights. Renewals during the weighted window also use dns01 and
   are unaffected by the split.
3. Once the host is at 100% on the Gateway, optionally remove the label to
   fall back to the gateway http01 solver (`use-gateway-solver: "true"`).

The traefik/ingress-nginx publishService switch is **not** affected by any of
this: both controllers serve the same solver `Ingress` objects (class
`nginx`), so http01 challenges answer on either NLB throughout that cutover.

You can prepare a [cutover from Ingress -> Gateway](https://www.pelotech.com/post/ingress-nginx-migration) by annotating `Ingress` objects with `100` weight and the new `HTTPRoutes` with `0` weight, and then flip weights once ready.

### Cert Manager Gateway Issuer

The envoy-gateway component **automatically** adds a labeled gateway solver to
the `letsencrypt` ClusterIssuer (`parentRefs: eg/envoy-gateway-system`,
selected by the `use-gateway-solver: "true"` label — see the
[ListenerSet annotations](#cert-manager-annotations) above). The Ingress
solver remains the default; no `create-issuer` patch is needed. The same
ordering rule applies: the cert-manager component must be listed *before*
`envoy-gateway`, or the patch is silently skipped.

Both solvers coexist indefinitely — the Ingress solver serves Ingress-based
apps, the labeled gateway solver serves Gateway API apps. (Only in the
unlikely case a cluster retires the Ingress API entirely would you patch
`create-issuer` to drop the Ingress solver.) See the
[create-issuer README](https://github.com/pelotech/foundation/blob/main/gitops/components/cert-manager/create-issuer/README.md)
for all available solver options and combinations.

Also be sure your Gateway has a [Listener for the challenge/solver on port 80](#gateway-certificate-challenge-acme-solver).

### Per-App Cleanup

Once an app's traffic has fully cut over to its `HTTPRoute`, delete that app's
old `Ingress` object so external-dns doesn't manage competing records for the
hostname.

There is **no requirement to move every app**: the Ingress API remains a
supported, first-class surface served by the maintained
[`traefik` component](../gitops/components/traefik/README.md). What must be
retired is only the EOL **ingress-nginx controller** — that happens via the
traefik component's publishService switch and is independent of any app's
Ingress-vs-Gateway choice (see the traefik README's cutover section).
