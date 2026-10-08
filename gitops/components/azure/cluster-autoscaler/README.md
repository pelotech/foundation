# cluster-autoscaler on Azure

The Azure flavor of the top-level [`cluster-autoscaler`](../../cluster-autoscaler) component, for clusters
whose agent pools are virtual machine scale sets. It discovers every scale set tagged
`cluster-autoscaler-enabled=true` and `cluster-autoscaler-name=<cluster>` and keeps each one between the
`min` and `max` tags of the scale set. `terraform-rke2-foundation` sets those tags on every pool that has
`min_count` and `max_count`; AKS clusters use Karpenter instead.

The controller runs on the control plane nodes and authenticates through the managed identity extension with
the identity those nodes carry, so no credential enters the cluster. That identity needs Contributor on the
node resource group, which the module grants.

Scaling is per pool: declare one pool per size class, with `min_count = 0` where a pool may be empty, and the
autoscaler picks the pool that fits a pending pod.

## Required `kustomize-environment` keys

| Key                         | Source (`terraform-rke2-foundation`)           |
|-----------------------------|------------------------------------------------|
| `CLUSTER_NAME`              | `cluster_name`                                 |
| `SERVER_IDENTITY_CLIENT_ID` | `server_identity_client_id`                    |
| `AZURE_NODE_RESOURCE_GROUP` | `node_resource_group_name`                     |
| `AZURE_SUBSCRIPTION_ID`     | `subscription_id`                              |
| `AZURE_TENANT_ID`           | `tenant_id`                                    |
| `AZURE_ENVIRONMENT`         | `AzurePublicCloud` or `AzureUSGovernmentCloud` |
