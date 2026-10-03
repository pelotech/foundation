# external-dns on Azure

The Azure flavor of the top-level [`external-dns`](../../external-dns) component. It
sets `provider: azure` and binds the controller to the `external_dns` workload identity
that `terraform-azure-foundation` creates (service account `external-dns-controller`
in namespace `external-dns`). Grant that identity `DNS Zone Contributor` on the zones
it manages through the module's `workload_identity.overrides.external_dns.dns_zone_ids`.

## Required `kustomize-environment` keys

| Key                      | Source                             |
|--------------------------|------------------------------------|
| `CLUSTER_NAME`           | `cluster_name` (the TXT owner id)  |
| `EXTERNAL_DNS_CLIENT_ID` | `external_dns_client_id`           |

## Required Secret

external-dns reads its Azure settings from `/etc/kubernetes/azure.json`. The flavor
mounts the Secret `external-dns-azure` from the `external-dns` namespace, which the
cluster provides next to its other secrets. With workload identity the file holds no
credential:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: external-dns-azure
  namespace: external-dns
type: Opaque
stringData:
  azure.json: |
    {
      "subscriptionId": "<subscription id>",
      "resourceGroup": "<resource group of the DNS zones>",
      "useWorkloadIdentityExtension": true
    }
```
