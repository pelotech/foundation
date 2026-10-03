# Azure Blob CSI driver

Installs the upstream [Azure Blob CSI driver](https://github.com/kubernetes-sigs/blob-csi-driver)
(`blob.csi.azure.com`) in `kube-system`. It is the Azure counterpart of
[`aws/s3-csi`](../../aws/s3-csi): a bucket-like store mounted into pods as a
`ReadWriteMany` volume, here a blob container through blobfuse2.

Foundation installs the driver itself, so the AKS-managed one must stay off
(`storage_drivers` default in `terraform-azure-foundation`). The module creates the
storage account, the containers and the kubelet identity grant with
`blob_csi = { enabled = true, managed_driver = false, containers = [...] }`.

## Volumes

The driver provisions nothing on its own here: mount an existing container with a
static PersistentVolume, as the S3 charts do. The kubelet identity authenticates, so
no account key is stored in the cluster.

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: assets
spec:
  capacity:
    storage: 20Gi
  accessModes:
    - ReadWriteMany
  mountOptions:
    - -o allow_other
  csi:
    driver: blob.csi.azure.com
    volumeHandle: <storage account>_assets
    volumeAttributes:
      resourceGroup: <resource group of the storage account>
      storageAccount: <storage account>
      containerName: assets
      protocol: fuse2
      AzureStorageAuthType: MSI
      AzureStorageIdentityClientID: <kubelet identity client id>
```

`volumeHandle` must be unique per container in the cluster and may not contain `#`
or `/`.

## Open points

Checked on paper, not on a cluster yet: the chart's node DaemonSet installs
blobfuse2 on the host and defaults `linux.distro` to `debian`. Confirm what Azure
Linux nodes need on the first live test.
