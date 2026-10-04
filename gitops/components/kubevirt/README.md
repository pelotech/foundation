# KubeVirt

Deploys [KubeVirt](https://kubevirt.io) and the
[Containerized Data Importer (CDI)](https://github.com/kubevirt/containerized-data-importer)
through an Argo CD Application (`kubevirt`, project `utils`).

## Layout

| Path | Purpose |
|---|---|
| [`kustomize`](kustomize) | Cloud-neutral operators, `CDI`, `KubeVirt` and cluster preferences. The `kubevirt` Application's entrypoint. |
| [`aws/kubevirt`](../aws/kubevirt) | AWS flavor: includes this component and points the Application at `aws/kubevirt/kustomize`, which adds the `gp3-immediate` class for CDI image imports, CDI scratch space on `gp3`, and Karpenter node placement (VMs on `metal` instances, the KubeVirt control plane on the `spot` node pool). Requires `aws/ebs-csi` and `aws/karpenter`. |
| [`azure/kubevirt`](../azure/kubevirt) | Azure flavor: includes this component and points the Application at `azure/kubevirt/kustomize`, which adds the default `premium-v2` class (Premium SSD v2, VM disks and CDI scratch space), `premium-lrs` for volumes that need host caching, the `premium-v2-immediate` class for CDI image imports, and CDI scratch space on `premium-v2`. Requires `azure/disk-csi`. |

On a real cluster list one flavor, `aws/kubevirt` or `azure/kubevirt`, and not
this component. The base alone sets no storage classes, no CDI scratch class
and no VM node placement.

CDI scratch space must use a `WaitForFirstConsumer` class, so it follows the
importer pod's node and zone.

Node placement is cloud-specific too. `base` only restricts the KubeVirt
control plane (`infra`) to Linux nodes, which overrides KubeVirt's default of
control-plane nodes, and sets no `workloads` selector, so VMs can schedule on
any Linux node.
