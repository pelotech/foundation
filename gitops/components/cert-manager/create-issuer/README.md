# create-issuer

Renders the `letsencrypt` `ClusterIssuer` with **composable ACME solvers**:
any mix of http01-via-Ingress, http01-via-Gateway, and dns01 (route53 or
Azure DNS) — simultaneously or alone. `acmeIssuerEmail` is wired from the
`kustomize-environment` ConfigMap (`ACME_ISSUER_EMAIL`) by the cert-manager
component; the dns01 provider settings are wired by the cloud flavor
(`aws/cert-manager`, `azure/cert-manager`).

## How solver selection works

cert-manager picks **one solver per Certificate**, choosing the entry whose
`selector` matches most specifically: `matchLabels` against the Certificate's
labels (shim-created Certificates inherit them from the annotated
Ingress/Gateway/ListenerSet), or `dnsZones` against the hostname — use
`dnsZones` to route whole domains to a solver without labeling anything. An
entry with **no** `matchLabels`/`dnsZones` is the default/catch-all; the chart
fails rendering if more than one entry is selector-less.

## Configuration

One reference example — every solver type together:

```yaml
solvers:
  ingress:                # shipped default: serves all unlabeled Certificates.
    - class: nginx        # served by the traefik component's nginx-compat
                          # provider (`- class: traefik` only for a
                          # native-provider Traefik).
  gateway:                # shipped default is [] - the envoy-gateway component
    - name: external      # ADDS THIS ENTRY AUTOMATICALLY (with the label below);
      namespace: envoy-gateway-system  # only configure it by hand to override.
      matchLabels:
        use-gateway-solver: "true"
  dns01:                  # one provider per cloud, off in the base; the cloud
    route53:              # flavor turns its own on, label-selected. Required
      enabled: true       # during weighted cutovers - see GATEWAY-ADOPTION.md.
      region: us-east-1
      matchLabels:
        use-dns01-solver: "true"
    azureDNS:
      enabled: false
      subscriptionID: ""
      resourceGroupName: ""
      hostedZoneName: ""
      clientID: ""        # workload identity of the cert-manager pods
```

Notes:

* **Gateway-only cluster**: `ingress: []` plus a single selector-less gateway
  entry. cert-manager's Gateway API feature flags are enabled automatically by
  the [envoy-gateway component](../../envoy-gateway/) — see
  [GATEWAY-ADOPTION.md](../../../../docs/GATEWAY-ADOPTION.md).
* Certificates opt into a labeled solver by carrying its label
  (`use-gateway-solver`, `use-dns01-solver`); everything else gets the
  selector-less default.
