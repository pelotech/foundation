# Trivy Operator

[docs](https://aquasecurity.github.io/trivy-operator/latest/)

Installs the Trivy Operator in the `trivy-system` namespace with the
[Trivy Operator Dashboard](https://github.com/raoulx24/trivy-operator-dashboard) behind an ingress, a cert-manager
certificate and HTTP basic auth.

Only the vulnerability scanner is enabled, and only for the namespaces listed in `TRIVY_TARGET_NAMESPACES`.
Scans run through the operator's built-in Trivy server (ClientServer mode): in Standalone mode every scan
container keeps its own cache, and multi-container pods deadlock on the cache lock. Scan jobs get 1Gi of memory and
30 minutes, enough for 1 GiB images pulled from slow registries.

## Required kustomize-environment vars
* `TRIVY_TARGET_NAMESPACES`: comma-separated namespaces to scan, e.g. `my-app-prod,my-app-staging`
* `TRIVY_DASHBOARD_HOST`: hostname of the dashboard, e.g. `trivy.my-cluster.example.com`

## Required secrets
A secret named `basic-auth` in `trivy-system` with an `auth` key in htpasswd format, e.g.
`htpasswd -nbB trivy '<password>'`. The ingress uses the `nginx.ingress.kubernetes.io/auth-*` annotations, which the
[`traefik` component](../traefik/README.md) serves through its nginx-compatible provider.

## Notes
* The dashboard reads every Trivy report in the cluster (ClusterRole), independent of `TRIVY_TARGET_NAMESPACES`.
* The dashboard's history feature is off: it needs a Valkey sidecar with a PVC.
* Clusters without cert-manager drop the `cert-manager.io/cluster-issuer` annotation and `spec.tls` with a patch,
  the same way they do for `argocd-server-ingress`.
