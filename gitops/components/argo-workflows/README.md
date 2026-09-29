# Argo Workflows

[docs](https://argo-workflows.readthedocs.io/en/latest/)

Installs Argo Workflows in the `argo-workflows` namespace, with the UI behind an ingress, a cert-manager certificate
and SSO through Argo CD's Dex. The controller and server live in `argo-workflows`; workflows run in namespaces the
cluster owns, each with its own ServiceAccount and RBAC.

## Required kustomize-environment vars
* `ARGO_WORKFLOWS_HOST`: hostname of the UI, e.g. `argo-workflows.my-cluster.example.com`
* `ARGOCD_SERVER_HOST`: already set for base-install; Dex is served at `https://ARGOCD_SERVER_HOST/api/dex`

## Required Dex client
Argo CD's `dex.config` is a single string, so the cluster adds the client to its own `argocd-cm` patch:
```yaml
dex.config: |
  connectors:
    ...
  staticClients:
    - id: argo-workflows-sso
      name: Argo Workflows
      redirectURIs:
        - https://<ARGO_WORKFLOWS_HOST>/oauth2/callback
      secret: $argo-workflows-sso:client-secret
```

## Required secrets
A secret named `argo-workflows-sso` with keys `client-id` (`argo-workflows-sso`) and `client-secret` (any random string),
in two namespaces:
* `argocd`, labeled `app.kubernetes.io/part-of: argocd` so Argo CD can resolve `$argo-workflows-sso:client-secret`
* `argo-workflows`, read by the Argo server

## Required SSO RBAC
Every login maps to a ServiceAccount in `argo-workflows` whose `workflows.argoproj.io/rbac-rule` expression matches
the user's Dex groups; a user who matches none cannot log in. Each of these ServiceAccounts needs a token secret named
`<service-account>.service-account-token`. The chart's `argo-workflows-admin` and `argo-workflows-view` ClusterRoles
cover Argo resources only, so also grant `pods` and `pods/log` read for the UI to show step logs.
See [SSO RBAC](https://argo-workflows.readthedocs.io/en/latest/argo-server-sso/#sso-rbac).
