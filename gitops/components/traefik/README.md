# Traefik (Ingress API controller, nginx drop-in)

Replaces the retired [ingress-nginx](https://kubernetes.io/blog/2025/11/11/ingress-nginx-retirement/)
controller with a maintained one, **without consumer changes**: Traefik's
[`kubernetesIngressNGINX` provider](https://doc.traefik.io/traefik/reference/install-configuration/providers/kubernetes/kubernetes-ingress-nginx/)
claims IngressClass `nginx` (controller `k8s.io/ingress-nginx`) and natively
interprets `nginx.ingress.kubernetes.io/*` annotations, so existing Ingresses —
including cert-manager's http01 solver Ingresses — keep working verbatim.

Gateway API is deliberately **not** enabled here; the `envoy-gateway` component
owns that surface.

## Required `kustomize-environment` keys

| Key | Purpose |
|---|---|
| `TRAEFIK_NLB_NAME` | Name of the NLB fronting Traefik (e.g. `traefik-CLUSTER-NAME`). Kept distinct from `CLUSTER_NAME` so this NLB coexists with ingress-nginx's during migration. |
| `TRAEFIK_PUBLISH_SERVICE` | `"true"`/`"false"` — whether Traefik writes Ingress `.status.loadBalancer` (where external-dns points DNS). |
| `NGINX_PUBLISH_SERVICE` | `"true"`/`"false"` — same switch for the ingress-nginx Application (cross-component; ignored once nginx is removed). |

**Exactly one** of the two `*_PUBLISH_SERVICE` keys may be `"true"`: both true
makes external-dns flap between the NLBs; both false makes external-dns
(`policy: sync`) **delete** the records. Start with nginx `"true"` / traefik
`"false"`; flipping the pair switches DNS between the controllers — in either
direction — without touching any Ingress. Ordering: list the
`aws-alb-nginx`/`ingress-nginx` component **before** `traefik` in
`components:` so the cross-component replacement finds its target.

The `networking` AppProject must allow `ghcr.io/traefik/helm` in `sourceRepos`
and the `traefik` namespace in `destinations`.

Requires the [`aws-alb`](../aws-alb/README.md) component (AWS Load Balancer
Controller) to reconcile the LoadBalancer Service into an NLB.

## Coexistence design (why the switch has no impact)

* Traefik gets its **own NLB** (`TRAEFIK_NLB_NAME`); ingress-nginx keeps its
  NLB and its traffic. Nothing changes for consumers on deploy.
* Ingress-status ownership is a **switch**: with `TRAEFIK_PUBLISH_SERVICE:
  "false"` / `NGINX_PUBLISH_SERVICE: "true"`, only ingress-nginx writes Ingress
  `.status.loadBalancer`, so external-dns records keep pointing at the nginx
  NLB. Flipping the pair moves DNS to Traefik's NLB — and flipping back rolls
  it back — with no Ingress changes.
* Real client IP parity: the NLB target groups use `proxy_protocol_v2` and the
  entryPoints trust PROXY protocol from `0.0.0.0/0` — the same trust posture
  as nginx's `proxy-real-ip-cidr` default. Clients can't spoof through the NLB
  (it prepends its own PROXY header); direct pod connections are VPC-internal
  only.
* No hostNetwork/hostPort, so nginx's port-81 pod-identity workaround is not
  needed.
* This component **owns the `nginx` IngressClass**
  ([ingress-class.yaml](ingress-class.yaml)) and patches the ingress-nginx
  chart to stop creating its copy — one owner throughout coexistence, and the
  object survives nginx's removal. Without it, deleting the nginx chart
  deletes the class and the AWS Load Balancer Controller's webhook then
  **denies every write** to class-`nginx` Ingresses ("invalid ingress class
  ... not found"), failing ArgoCD syncs and cert-manager http01 solver
  creation (traffic keeps flowing — Traefik matches the class by name).

## Cutover (per cluster, when ready)

1. Verify serving: resolve a host against the Traefik NLB directly
   (edit `/etc/hosts` or `curl --resolve`) — Ingresses are already live on it.
2. Optionally shift per-host with Route53 weighted records
   (`external-dns.alpha.kubernetes.io/aws-weight` + `set-identifier`), as in
   [GATEWAY-ADOPTION.md](../../../docs/GATEWAY-ADOPTION.md).
3. Flip the switch: `TRAEFIK_PUBLISH_SERVICE: "true"` +
   `NGINX_PUBLISH_SERVICE: "false"` — Ingress statuses (and external-dns
   records) move to the Traefik NLB. Rollback is flipping the pair back. Once
   confident, remove the `ingress-nginx` component (or the aggregate's nginx
   half).
4. Delete nginx's leftover admission webhook, or Ingress writes will fail
   against the dead webhook service:
   `kubectl delete validatingwebhookconfiguration ingress-nginx-admission`.
5. Delete the old NLB; hunt orphans via
   [CLEANUP.md](../../../docs/CLEANUP.md) tags. `TRAEFIK_NLB_NAME` can then be
   replaced with `CLUSTER_NAME`.

## Known compatibility gaps vs ingress-nginx

Audit consumer Ingresses against the
[supported annotations list](https://doc.traefik.io/traefik/reference/routing-configuration/kubernetes/ingress-nginx/)
before cutover. Highlights:

* snippet annotations are **enabled** for nginx parity, but only a directive
  subset is parsed (`add_header`, `proxy_set_header`, `more_set_headers`,
  `set`, `if`, `return`, ...) with common `$var` interpolation — raw nginx
  config (Lua, tuning directives) is never executed. Audit snippets against
  the supported list. Note that in multi-tenant clusters `proxy_set_header`
  still lets any Ingress-creating namespace spoof headers upstreams may trust;
  once snippet users have migrated, disable this per cluster
  (`allowSnippetAnnotations: false` via an ArgoCD Application patch).
* mTLS: `auth-tls-secret`/`auth-tls-verify-client`/`auth-tls-pass-certificate-to-upstream`
  work; failed validation rejects at the TLS handshake instead of returning
  nginx's `400`. `auth-tls-match-cn` and `auth-tls-error-page` are unsupported.
* `ssl-passthrough` only for single-path/rule Ingresses; `auth-tls-verify-depth`
  is accepted but not enforced.
