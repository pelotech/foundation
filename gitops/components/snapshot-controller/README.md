# Snapshot controller

The [external-snapshotter](https://github.com/kubernetes-csi/external-snapshotter)
`snapshot.storage.k8s.io` CRDs and snapshot-controller, in `kube-system`,
with sync wave `-10` and a `CriticalAddonsOnly` toleration.

This is **not a Kustomize Component** to list under `components:`. It is a
shared Argo CD source that each CSI driver's Application syncs as its first
source:

* [`aws/ebs-csi`](../aws/ebs-csi)
* [`azure/disk-csi`](../azure/disk-csi/README.md)

Keeping it in the driver's Application, instead of a separate Application,
lets the sync wave apply the CRDs before the driver's VolumeSnapshotClass in
the same sync. Argo CD does not retry a failed automated sync on the same
revision, so a VolumeSnapshotClass that synced before the CRDs existed would
otherwise stay failed until the next commit.

A cluster runs one CSI driver component, so only one Application owns these
resources.
