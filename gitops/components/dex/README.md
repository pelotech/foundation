# Dex

[docs](https://dexidp.io/docs/)

Installs [Dex](https://dexidp.io/) in the `dex` namespace behind an ingress with a cert-manager certificate. Dex is
an OpenID Connect provider: services such as Harbor or Argo Workflows log in through it, and it delegates the login
to an upstream connector such as GitHub.

The component ships the chart, the in-cluster Kubernetes storage, the ingress and the `dex-secrets` environment
Secret. Connectors are sub-components the consumer picks. Clients differ per deployment, so the consumer adds them
with a patch.

## Required kustomize-environment vars
* `DEX_HOST`: hostname of the ingress, e.g. `dex.my-cluster.example.com`. The issuer is `https://<DEX_HOST>`.

## Required secrets
A Secret named `dex-secrets` in `dex`. Every key becomes an environment variable of the Dex pod. Reference them from
the config as `$KEY` in connectors and as `secretEnv: KEY` in static clients, so the config file holds no secrets.

The Secret can come from a second source on the Application, e.g. a ksops directory in the consumer's repo. The
`utils` project must then allow that repo in `spec.sourceRepos`.

## Connectors
Dex needs at least one connector. Each one is a sub-component that appends to `config.connectors`, so list it after
the base:

```yaml
components:
  - https://github.com/pelotech/foundation//gitops/components/dex?ref=<version>
  - https://github.com/pelotech/foundation//gitops/components/dex/connectors/github?ref=<version>
```

| Connector | Vars | `dex-secrets` keys |
|-----------|------|--------------------|
| `connectors/github` | `DEX_GITHUB_ORG`: GitHub org whose members may log in; teams come back as groups by slug | `GITHUB_CLIENT_ID`, `GITHUB_CLIENT_SECRET` from a GitHub OAuth app with callback `https://<DEX_HOST>/callback` |

A connector that is not here yet can still be added with a patch on `/spec/sources/0/helm/valuesObject/config/connectors/-`.

## Required patch
Add the static clients of the apps that log in through Dex:

```yaml
- op: add
  path: /spec/sources/0/helm/valuesObject/config/staticClients
  value:
    - id: harbor
      name: Harbor
      secretEnv: HARBOR_DEX_CLIENT_SECRET
      redirectURIs:
        - https://registry.my-cluster.example.com/c/oidc/callback
```

## Notes
* The Application has sync wave `-1`, so apps that log in through Dex sync after it.
* Clusters without cert-manager drop the `cert-manager.io/cluster-issuer` annotation and `spec.tls` with a patch,
  the same way they do for `argocd-server-ingress`.
