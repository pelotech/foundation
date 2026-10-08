# cluster-autoscaler on Azure

Scales the agent pools of an RKE2 cluster from `terraform-rke2-foundation`. Karpenter does not apply there:
its Azure provider builds AKS nodes only. The autoscaler discovers every scale set tagged
`cluster-autoscaler-enabled=true` and `cluster-autoscaler-name=<cluster>`, which the module sets on each pool
that has `min_count` and `max_count`, and keeps each pool between the `min` and `max` tags of its scale set.

It runs on the server nodes with the server identity through the managed identity extension, so it needs no
credential in the cluster. The module grants that identity Contributor on the node resource group.

Scaling is per pool: declare one pool per size class in the module, with `min_count = 0` where a pool may be
empty, and the autoscaler picks the pool that fits a pending pod.

## Required `kustomize-environment` keys

| Key                         | Source (`terraform-rke2-foundation`)                        |
|-----------------------------|-------------------------------------------------------------|
| `CLUSTER_NAME`              | `cluster_name`                                              |
| `SERVER_IDENTITY_CLIENT_ID` | `server_identity_client_id`                                 |
| `AZURE_NODE_RESOURCE_GROUP` | `node_resource_group_name`                                  |
| `AZURE_SUBSCRIPTION_ID`     | `subscription_id`                                           |
| `AZURE_TENANT_ID`           | `tenant_id`                                                 |
| `AZURE_ENVIRONMENT`         | `AzurePublicCloud` or `AzureUSGovernmentCloud`              |
