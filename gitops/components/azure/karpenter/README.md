# Karpenter on Azure (self-hosted)

Deploys the AKS Karpenter provider chart from MCR with the pelotech controller image
(`ghcr.io/pelotech/karpenter-azure`). Use it with `terraform-azure-foundation` and `karpenter.mode = "self-hosted"`.

Provisioning mode is the controller default (`aksscriptless`). The component installs the chart only. The
`AKSNodeClass` and `NodePool`s live in the cluster's own overlay, as the `EC2NodeClass` does on AWS.

## Required `kustomize-environment` keys

Most values are outputs of `terraform-azure-foundation`.

| Key                          | Source                                                  |
|------------------------------|---------------------------------------------------------|
| `CLUSTER_NAME`               | `cluster_name`                                          |
| `CLUSTER_ENDPOINT`           | `cluster_endpoint`                                      |
| `AZURE_SUBSCRIPTION_ID`      | Azure subscription of the cluster                       |
| `AZURE_LOCATION`             | `location`                                              |
| `AZURE_NODE_RESOURCE_GROUP`  | `node_resource_group_name`                              |
| `VNET_SUBNET_ID`             | `node_subnet_id`                                        |
| `KUBELET_IDENTITY_CLIENT_ID` | `kubelet_identity_client_id`                            |
| `KUBELET_IDENTITY_ID`        | `kubelet_identity_id`                                   |
| `KARPENTER_CLIENT_ID`        | `karpenter_client_id`                                   |
| `NETWORK_PLUGIN`             | `network_plugin_resolved`                               |
| `NETWORK_PLUGIN_MODE`        | `network_plugin_mode_resolved`, empty string when unset |
| `NETWORK_DATAPLANE`          | `network_data_plane_resolved`, empty string when unset  |
| `SSH_PUBLIC_KEY`             | public key placed on provisioned nodes                  |

## Bootstrap token

The controller reads its kubelet bootstrap token from the secret `karpenter-kubelet-bootstrap`, key `token`, in the
`karpenter` namespace. Keep it as a SOPS-encrypted `Secret` in the `infrastructure` repo, listed in the cluster's
ksops generator like its other secrets:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: karpenter-kubelet-bootstrap
  namespace: karpenter
type: Opaque
stringData:
  token: <id>.<secret>
```

The token is not rotated by this component.
