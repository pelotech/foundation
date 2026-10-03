# KubeVirt

Deploys [KubeVirt](https://kubevirt.io) and the
[Containerized Data Importer (CDI)](https://github.com/kubevirt/containerized-data-importer)
through an Argo CD Application (`kubevirt`, project `utils`).

## Layout

| Path | Purpose |
|---|---|
| [`kustomize/base`](kustomize/base) | Cloud-neutral operators, `CDI`, `KubeVirt` and cluster preferences. |
| [`kustomize/aws`](kustomize/aws) | AWS settings: the `gp3-immediate` class for CDI image imports, CDI scratch space on `gp3`, and Karpenter node placement (VMs on `metal` instances, the KubeVirt control plane on the `spot` node pool). Requires `aws/ebs-csi` and `aws/karpenter`. |
| [`kustomize/azure`](kustomize/azure) | Azure storage settings: the default `premium-v2` class (Premium SSD v2, VM disks and CDI scratch space), `premium-lrs` for volumes that need host caching, the `premium-lrs-immediate` class for CDI image imports, and CDI scratch space on `premium-v2`. Requires `azure/disk-csi`. |
| [`kustomize`](kustomize) | The Application's default entrypoint: `base` + `aws`. |

This component renders the AWS settings by default. On AKS use the
[`azure/kubevirt`](../azure/kubevirt) flavor **instead of** this component;
it points the Application at an Azure entrypoint (`base` + `azure`).

CDI scratch space must use a `WaitForFirstConsumer` class, so it follows the
importer pod's node and zone.

Node placement is cloud-specific too. `base` only restricts the KubeVirt
control plane (`infra`) to Linux nodes, which overrides KubeVirt's default of
control-plane nodes, and sets no `workloads` selector, so VMs can schedule on
any Linux node.
