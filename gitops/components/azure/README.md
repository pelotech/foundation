# Azure components

Components in this directory are **meaningful only on Azure/AKS**:

* [`disk-csi`](disk-csi/README.md): the upstream Azure Disk CSI driver Helm
  chart, the shared [`snapshot-controller`](../snapshot-controller/README.md),
  and the default VolumeSnapshotClass. The Azure counterpart of
  [`aws/ebs-csi`](../aws/ebs-csi). On AKS, the managed disk driver and
  snapshot controller must be disabled.
* [`kubevirt`](kubevirt): the Azure flavor of the top-level
  [`kubevirt`](../kubevirt) component. It includes the cloud-neutral base and
  points its Argo CD Application at an Azure entrypoint that adds the Azure
  storage settings (the default `premium-v2`, `premium-lrs` and
  `premium-v2-immediate` StorageClasses, CDI scratch space on `premium-v2`).
  Use it **instead of** `kubevirt`, never both (including both fails with a
  duplicate-resource error), and include `azure/disk-csi` alongside it.

This is the flavor pattern described in [`aws/README.md`](../aws/README.md):
the base carries no cloud settings, and `aws/kubevirt` is the AWS sibling.

Note: the Azure flavor sets no KubeVirt node selectors yet. VMs can schedule
on any Linux node, so every node pool that may run them needs a VM size that
supports nested virtualization.

## Example

```yaml
components:
  - https://github.com/pelotech/foundation//gitops/components/azure/disk-csi?ref=vX.Y.Z
  - https://github.com/pelotech/foundation//gitops/components/azure/kubevirt?ref=vX.Y.Z
```
