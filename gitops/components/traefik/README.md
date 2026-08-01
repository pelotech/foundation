# Traefik (the Ingress API controller)

The platform's Ingress controller, replacing the retired
[ingress-nginx](https://kubernetes.io/blog/2025/11/11/ingress-nginx-retirement/)
controller **without consumer changes**: Traefik's
[`kubernetesIngressNGINX` provider](https://doc.traefik.io/traefik/reference/install-configuration/providers/kubernetes/kubernetes-ingress-nginx/)
claims IngressClass `nginx` (controller `k8s.io/ingress-nginx`) and natively
interprets `nginx.ingress.kubernetes.io/*` annotations, so Ingresses written
for ingress-nginx — including cert-manager's http01 solver Ingresses — work
verbatim.

Gateway API is deliberately **not** enabled here; the `envoy-gateway`
component owns that surface.

## Required `kustomize-environment` keys

| Key | Purpose |
|---|---|
| `TRAEFIK_NLB_NAME` | Name of the NLB fronting Traefik (e.g. `traefik-CLUSTER-NAME`), kept distinct per data plane (envoy-gateway has its own via `EG_NLB_NAME`). |

The `networking` AppProject must allow `ghcr.io/traefik/helm` in `sourceRepos`
and the `traefik` namespace in `destinations`. Requires the
[`aws/alb`](../aws/alb/README.md) component (AWS Load Balancer Controller) to
reconcile the LoadBalancer Service into an NLB.

## Design notes

* This component **owns the `nginx` IngressClass**
  ([ingress-class.yaml](ingress-class.yaml), marked default). The object must
  exist even though Traefik matches the class by name: the AWS Load Balancer
  Controller's webhook denies every Ingress write whose class object is
  missing.
* Real client IP: the NLB target groups use `proxy_protocol_v2` and the
  entryPoints trust PROXY protocol from `0.0.0.0/0` — the same trust posture
  as ingress-nginx's `proxy-real-ip-cidr` default. Clients can't spoof through
  the NLB (it prepends its own PROXY header); direct pod connections are
  VPC-internal only.
* No hostNetwork/hostPort (the pod-identity agent owns host port 80, which is
  why ingress-nginx needed its containerPort-81 workaround).
* `publishService` is enabled: Traefik writes Ingress
  `.status.loadBalancer`, which is where external-dns reads record targets.

## Migrating a cluster that still runs ingress-nginx

The ingress-nginx and `aws/alb-nginx` components were removed in this
foundation version. Clusters still running nginx should complete the
Traefik cutover **on their current (pre-removal) foundation tag** — that
tag's traefik README documents the side-by-side NLB and publishService
switch procedure — and then upgrade. After the upgrade:

1. Delete nginx's leftover admission webhook, or Ingress writes will fail
   against the dead webhook service:
   `kubectl delete validatingwebhookconfiguration ingress-nginx-admission`
2. Remove the `NGINX_PUBLISH_SERVICE` and `TRAEFIK_PUBLISH_SERVICE` keys from
   `kustomize-environment` (the switch no longer exists; Traefik always
   publishes).
3. Delete the old nginx NLB; hunt orphans via
   [CLEANUP.md](../../../docs/CLEANUP.md) tags.

## Known compatibility gaps vs ingress-nginx

Audit Ingresses against the
[supported annotations list](https://doc.traefik.io/traefik/reference/routing-configuration/kubernetes/ingress-nginx/).
Highlights:

* snippet annotations are **enabled** for nginx parity, but only a directive
  subset is parsed (`add_header`, `proxy_set_header`, `more_set_headers`,
  `set`, `if`, `return`, ...) with common `$var` interpolation — raw nginx
  config (Lua, tuning directives) is never executed. Note that in multi-tenant
  clusters `proxy_set_header` still lets any Ingress-creating namespace spoof
  headers upstreams may trust; disable per cluster once snippet users migrate
  (`allowSnippetAnnotations: false` via an ArgoCD Application patch).
* mTLS: `auth-tls-secret`/`auth-tls-verify-client`/`auth-tls-pass-certificate-to-upstream`
  work; failed validation rejects at the TLS handshake instead of returning
  nginx's `400`. `auth-tls-match-cn` and `auth-tls-error-page` are unsupported.
* `ssl-passthrough` only for single-path/rule Ingresses; `auth-tls-verify-depth`
  is accepted but not enforced.
* `app-root` only redirects requests that match a declared path — the Ingress
  must include a `path: /` (Prefix) rule (nginx redirected at server scope
  without one); otherwise `/` returns 404.
