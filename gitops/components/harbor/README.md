# Harbor

[docs](https://goharbor.io/docs/)

Installs [Harbor](https://goharbor.io/) in the `harbor` namespace: the chart, a CloudNativePG Postgres cluster and
the registry ServiceAccount. The [`crossplane`](crossplane) sub-component adds the
[provider-harbor](https://github.com/globallogicuki/provider-harbor) Crossplane provider with the instance-wide jobs
(garbage collection, audit log purge, scanner schedule).

The base carries no cloud settings: registry storage and Postgres backups need a bucket and an identity. A cluster
lists one flavor, [`aws/harbor-s3`](../aws/harbor-s3/README.md), never the base alone. Needs the `cnpg` and
`crossplane` components.

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
| `crossplane-harbor-admin-creds` | `credentials` | the `crossplane` sub-component's `ProviderConfig`, JSON with `url`, `username`, `password` |
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

## Crossplane
`harbor/crossplane` is opt-in and listed after the flavor:

```yaml
components:
  - https://github.com/pelotech/foundation//gitops/components/aws/harbor-s3?ref=<version>
  - https://github.com/pelotech/foundation//gitops/components/harbor/crossplane?ref=<version>
```

It installs `provider-harbor` v3.11.2 (wraps terraform-provider-harbor 3.11.2), its `ProviderConfig`, and the
`GarbageCollection`, `PurgeAuditLog` and `InterrogationServices` jobs. Projects, robot accounts, replication
registries, retention and immutability rules, group bindings and the OIDC `ConfigAuth` are the consumer's: apply
them as managed resources from the consumer source.

The sub-component also sets an Argo CD health check for `*.harbor.crossplane.io` resources that trusts `Synced` and
`Ready`. The built-in Crossplane check reports Degraded whenever `LastAsyncOperation` is False, and upjet never
clears that condition after one failed apply ([crossplane/upjet#679](https://github.com/crossplane/upjet/issues/679)),
so a harbor-core restart during a reconcile would leave resources red for good. The check lives under the
`resource.customizations` key, the only place Argo CD accepts wildcards; nothing else in foundation writes that key.

## Notes
* `secretKey` encrypts what Harbor stores in its database: the OIDC client secret and registry endpoint
  credentials. Changing it afterwards leaves those undecryptable while the provider still reports `Synced`,
  because the Harbor API masks them. Re-send them after a change.
* Clusters without cert-manager drop the `cert-manager.io/cluster-issuer` annotation and the TLS secret with a
  patch, the same way they do for `argocd-server-ingress`.
