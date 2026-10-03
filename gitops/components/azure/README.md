# Azure components

Components in this directory are **meaningful only on Azure/AKS**:

* [`disk-csi`](disk-csi/README.md): the upstream Azure Disk CSI driver Helm
  chart, the shared [`snapshot-controller`](../snapshot-controller/README.md),
  and the default VolumeSnapshotClass. The Azure counterpart of
  [`aws/ebs-csi`](../aws/ebs-csi). On AKS, the managed disk driver and
  snapshot controller must be disabled.
* [`kubevirt`](kubevirt): a flavor of the top-level
  [`kubevirt`](../kubevirt) component. It includes the base component and
  points its Argo CD Application at an Azure entrypoint that renders the
  same cloud-neutral KubeVirt/CDI base with Azure storage settings (the
  default `premium-v2`, `premium-lrs` and `premium-lrs-immediate` StorageClasses,
  CDI scratch space on `premium-v2`) instead of the AWS ones. Use it **instead
  of** `kubevirt`, never both (including both fails with a duplicate-resource
  error), and include `azure/disk-csi` alongside it.

The top-level `kubevirt` component still renders the AWS settings by
default, so existing AWS consumers are unchanged. This follows the flavor
pattern described in [`aws/README.md`](../aws/README.md), without yet moving
the AWS settings into an `aws/kubevirt` flavor (that would force every AWS
consumer to change their component list).

Note: the Azure flavor sets no KubeVirt node selectors yet. VMs can schedule
on any Linux node, so every node pool that may run them needs a VM size that
supports nested virtualization.

## Example

```yaml
components:
  - https://github.com/pelotech/foundation//gitops/components/azure/disk-csi?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/kubevirt?ref=vX.Y.Z
```
