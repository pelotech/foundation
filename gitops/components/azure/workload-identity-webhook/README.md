# Azure workload identity webhook

The mutating webhook of [Azure Workload Identity](https://azure.github.io/azure-workload-identity/). It
injects the client id, the tenant and a projected service account token into every pod that carries the
label `azure.workload.identity/use: "true"`, so the Azure flavors of `external-dns`, `cert-manager` and
`karpenter` get a token for their identity without a credential in the cluster.

AKS ships this webhook as an add-on. `terraform-azure-foundation` turns that add-on off by default, and
RKE2 clusters from `terraform-rke2-foundation` never had it, so this component runs it on both. It syncs
in wave `-1`: the first pods of the controllers above are created after it answers.

The cluster must publish an OIDC issuer that Entra can reach, which both modules do.

## Required `kustomize-environment` keys

| Key                 | Source                                                     |
|---------------------|------------------------------------------------------------|
| `AZURE_TENANT_ID`   | `tenant_id`, the Entra tenant of the identities            |
| `AZURE_ENVIRONMENT` | `AzurePublicCloud` or `AzureUSGovernmentCloud`             |
