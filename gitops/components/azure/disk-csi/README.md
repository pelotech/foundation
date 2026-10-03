# Azure Disk CSI driver

Installs the upstream [Azure Disk CSI driver](https://github.com/kubernetes-sigs/azuredisk-csi-driver)
(`disk.csi.azure.com`), the snapshot controller and the default
VolumeSnapshotClass. It is the Azure counterpart of
[`aws/ebs-csi`](../../aws/ebs-csi) and follows the same shape: a multi-source
Argo CD Application (`azure-disk-csi`, project `storage`) with

1. the shared [`snapshot-controller`](../../snapshot-controller/README.md)
   (external-snapshotter CRDs and snapshot-controller, sync wave `-10`), the
   same source `aws/ebs-csi` uses,
2. the VolumeSnapshotClass in [`snapshot-class/`](snapshot-class), and
3. the `azuredisk-csi-driver` Helm chart from
   `https://kubernetes-sigs.github.io/azuredisk-csi-driver`.

The VolumeSnapshotClass is in this Application, not with its users, because
it needs the snapshot CRDs: in the same Application the CRDs' sync wave
applies them first. Argo CD does not retry a failed automated sync on the
same revision, so a VolumeSnapshotClass in another Application that synced
before the CRDs existed would stay failed until the next commit.

Foundation always installs the driver itself on Azure, including on AKS, so
the driver version is pinned in git and the same component works on any
Azure cluster (e.g. RKE2 later).

Chart settings:

* `snapshot.enabled: false`: the chart can bundle the external-snapshotter
  CRDs and snapshot-controller, but the shared `snapshot-controller` source
  provides them instead. The driver's `csi-snapshotter` sidecar is deployed
  either way.
* `snapshot.VolumeSnapshotClass.enabled: false`: the chart's class is a Helm
  post-install hook and cannot be marked default. `azure-disk-snapshot` in
  `snapshot-class/` is used instead.
* `windows.enabled: false`: no Windows node DaemonSet.

## Classes

| Name | Kind | Where | Settings | AWS counterpart |
|---|---|---|---|---|
| `azure-disk-snapshot` | VolumeSnapshotClass | this component (`snapshot-class/`) | `deletionPolicy: Delete`, **default** snapshot class | `ebs-snapshot` (`aws/ebs-csi`) |
| `premium-lrs` | StorageClass | [`kubevirt/kustomize/azure`](../../kubevirt/kustomize/azure) | `Premium_LRS`, `WaitForFirstConsumer`, expansion allowed, `Delete`, **default** class | `gp3` (`aws/ebs-csi`) |
| `premium-lrs-immediate` | StorageClass | [`kubevirt/kustomize/azure`](../../kubevirt/kustomize/azure) | `Premium_LRS`, `Immediate`, expansion allowed, `Delete` | `gp3-immediate` (`kubevirt/kustomize/aws`) |

The chart creates no StorageClasses (unlike `aws-ebs-csi-driver`'s
`storageClasses` value), and both Azure StorageClasses come from the KubeVirt
component. An Azure cluster without `azure/kubevirt` has no default
StorageClass.

`premium-lrs` is the default class because, with the managed disk driver
disabled, AKS provides none. If AKS still creates its built-in classes
(`default`, `managed-csi`, ...), it marks `default` as default too; with two
defaults Kubernetes uses the newest one, so remove one of the annotations.
Snapshots that name no class fail when there is more than one default
VolumeSnapshotClass for the driver.

## Requirements

* **On AKS, the managed Azure Disk CSI driver and snapshot controller are
  disabled**: `az aks create/update --disable-disk-driver
  --disable-snapshot-controller` (Terraform `azurerm_kubernetes_cluster`:
  `storage_profile { disk_driver_enabled = false, snapshot_controller_enabled
  = false }`). Both install the same CSIDriver, snapshot CRDs and controllers
  as this Application, and running both conflicts.
* The controller reads the Azure cloud config from the
  `kube-system/azure-cloud-provider` Secret, falling back to
  `/etc/kubernetes/azure.json` on the node (present on AKS nodes). The
  identity in that config needs `Contributor` on the resource group that
  holds the disks (on AKS, the node resource group).
* Clusters from [`terraform-azure-foundation`](https://github.com/pelotech/terraform-azure-foundation)
  meet both requirements by default: `storage_drivers` turns every
  AKS-managed driver off, and the module then grants the kubelet identity
  `Contributor` on the node resource group.
* No `kustomize-environment` keys are needed.

## References

* [Helm chart and values](https://github.com/kubernetes-sigs/azuredisk-csi-driver/tree/master/charts)
* [Install the open source driver on AKS](https://github.com/kubernetes-sigs/azuredisk-csi-driver/blob/master/docs/install-driver-on-aks.md)
* [CSI drivers on AKS: enable and disable the managed drivers](https://learn.microsoft.com/azure/aks/csi-storage-drivers)
* [Volume snapshot class parameters for Azure Disks](https://learn.microsoft.com/azure/aks/create-volume-azure-disk#volume-snapshot-class-parameters-for-azure-disks)
