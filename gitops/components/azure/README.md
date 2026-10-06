# Azure components

Components in this directory are **meaningful only on Azure/AKS**:

* [`karpenter`](karpenter/README.md): the self-hosted AKS Karpenter provider.
* [`disk-csi`](disk-csi/README.md): the upstream Azure Disk CSI driver Helm
  chart, the shared [`snapshot-controller`](../snapshot-controller/README.md),
  and the default VolumeSnapshotClass. The Azure counterpart of
  [`aws/ebs-csi`](../aws/ebs-csi). On AKS, the managed disk driver and
  snapshot controller must be disabled.
* [`blob-csi`](blob-csi/README.md): the upstream Azure Blob CSI driver, the
  Azure counterpart of `aws/s3-csi`.
* [`kubevirt`](kubevirt): the Azure flavor of the top-level
  [`kubevirt`](../kubevirt) component. It includes the cloud-neutral base and
  points its Argo CD Application at an Azure entrypoint that adds the Azure
  storage settings (the default `premium-v2`, `premium-lrs` and
  `premium-v2-immediate` StorageClasses, CDI scratch space on `premium-v2`).
  Include `azure/disk-csi` alongside it.
* The Azure flavors of the generic top-level controllers:
  [`cert-manager`](cert-manager) (workload identity plus the Azure DNS dns01
  solver) and [`external-dns`](external-dns/README.md) (`provider: azure` with
  workload identity). Each includes its base and layers the Azure settings on
  it. `traefik` needs no flavor here: AKS fronts the base's Service with a
  public Standard Load Balancer.

Use one flavor **instead of** its base, never both: including two of them
fails with a duplicate-resource error.

Note: the Azure `kubevirt` flavor sets no KubeVirt node selectors yet. VMs can
schedule on any Linux node, so every node pool that may run them needs a VM
size that supports nested virtualization.

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
  - https://github.com/pelotech/foundation//gitops/components/azure/disk-csi?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/blob-csi?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/kubevirt?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/karpenter?ref=vX.Y.Z
```
