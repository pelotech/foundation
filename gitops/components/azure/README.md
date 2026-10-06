# Azure components

Components in this directory are **meaningful only on Azure/AKS**:

* [`karpenter`](karpenter/README.md): the self-hosted AKS Karpenter provider.
* [`blob-csi`](blob-csi/README.md): the upstream Azure Blob CSI driver, the
  Azure counterpart of `aws/s3-csi`.
* The Azure flavors of the generic top-level controllers:
  [`cert-manager`](cert-manager) (workload identity plus the Azure DNS dns01
  solver) and [`external-dns`](external-dns/README.md) (`provider: azure` with
  workload identity). Each includes its base and layers the Azure settings on
  it. `traefik` needs no flavor here: AKS fronts the base's Service with a
  public Standard Load Balancer.

Use one flavor **instead of** its base, never both: including two of them
fails with a duplicate-resource error.

## Required `kustomize-environment` keys

| Key                         | Used by                     | Source (`terraform-azure-foundation`) |
|-----------------------------|-----------------------------|---------------------------------------|
| `AZURE_SUBSCRIPTION_ID`     | karpenter, cert-manager     | subscription of the cluster           |
| `AZURE_DNS_RESOURCE_GROUP`  | cert-manager                | resource group of the DNS zone        |
| `AZURE_DNS_ZONE`            | cert-manager                | DNS zone name                         |
| `CERT_MANAGER_CLIENT_ID`    | cert-manager                | `cert_manager_client_id`              |
| `EXTERNAL_DNS_CLIENT_ID`    | external-dns                | `external_dns_client_id`              |

Karpenter's own keys are listed in its README. The workload identities need
`DNS Zone Contributor` on the zone, granted by the module's
`workload_identity.overrides.<identity>.dns_zone_ids`.

## Example

```yaml
components:
  - https://github.com/pelotech/foundation//gitops/components/traefik?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/cert-manager?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/external-dns?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/blob-csi?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/karpenter?ref=vX.Y.Z
```
