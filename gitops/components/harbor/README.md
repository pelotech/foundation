# Harbor

[docs](https://goharbor.io/docs/)

Installs [Harbor](https://goharbor.io/) in the `harbor` namespace: the chart, a CloudNativePG Postgres cluster and
the registry ServiceAccount. Nothing inside Harbor: projects, robots, registries and the instance settings are the
consumer's, by hand, through the API, or with a tool such as
[provider-harbor](https://github.com/globallogicuki/provider-harbor).

The base carries no cloud settings: registry storage and Postgres backups need a bucket and an identity. A cluster
lists one flavor, [`aws/harbor-s3`](../aws/harbor-s3/README.md), never the base alone. Needs the `cnpg` component.

Two replicas of every Harbor service; patch the chart `valuesObject` to change that.

## Required kustomize-environment vars
* `HARBOR_HOST`: hostname of the registry, e.g. `registry.my-cluster.example.com`. The external URL is
  `https://<HARBOR_HOST>`.

The flavor adds its own, see its README.

## Required secrets
All in the `harbor` namespace:

| Secret | Key | Used by |
|--------|-----|---------|
| `harbor-admin-password` | `HARBOR_ADMIN_PASSWORD` | the chart, initial admin password |
| the pinned chart secrets | `secretKey`, `core.secret`, `core.xsrfKey`, `jobservice.secret`, `registry.secret`, `registry.credentials.*`, `core.tokenKey`, `core.tokenCert` | the chart, see below |

The chart generates its internal secrets with `randAlphaNum` when they are not set, and Argo CD renders with
`helm template`, so they change on every reconcile. Pin them in a sops-encrypted values file in the consumer repo
and add it as a second values file:

```yaml
- op: add
  path: /spec/sources/-
  value:
    repoURL: https://github.com/my-org/my-repo
    targetRevision: main
    ref: values
- op: add
  path: /spec/sources/0/helm/valueFiles
  value:
    - $values/clusters/my-cluster/harbor/harbor.values.enc.yaml
```

The `utils` project must then allow the consumer repo in `spec.sourceRepos`. The same source can carry the ksops
Secrets above and the tenant resources below.

## Managing Harbor with Crossplane
With [provider-harbor](https://github.com/globallogicuki/provider-harbor) the consumer installs the `Provider` and
`ProviderConfig` and applies its managed resources from the consumer source. Two patches on the Application help:

```yaml
# provider-harbor CRDs land after the Provider syncs.
- op: add
  path: /spec/syncPolicy/syncOptions/-
  value: SkipDryRunOnMissingResource=true
# Crossplane resolves *Ref fields and writes the resolved value back into the literal field.
- op: add
  path: /spec/ignoreDifferences
  value:
    - group: robotaccount.harbor.crossplane.io
      kind: RobotAccount
      jqPathExpressions:
        - .spec.forProvider.permissions[].namespace
```

Argo CD's built-in Crossplane health check reports Degraded whenever `LastAsyncOperation` is False, and upjet never
clears that condition after one failed apply ([crossplane/upjet#679](https://github.com/crossplane/upjet/issues/679)),
so a harbor-core restart during a reconcile leaves resources red for good while `Ready` and `Synced` are True. A
`resource.customizations` entry for `*.harbor.crossplane.io/*` that trusts `Synced` and `Ready` fixes the signal.

## Notes
* `secretKey` encrypts what Harbor stores in its database: the OIDC client secret and registry endpoint
  credentials. Changing it afterwards leaves those undecryptable while the provider still reports `Synced`,
  because the Harbor API masks them. Re-send them after a change.
* Clusters without cert-manager drop the `cert-manager.io/cluster-issuer` annotation and the TLS secret with a
  patch, the same way they do for `argocd-server-ingress`.
