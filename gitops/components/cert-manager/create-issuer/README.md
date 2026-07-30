# create-issuer

Renders the `letsencrypt` `ClusterIssuer` with **composable ACME solvers**:
any mix of http01-via-Ingress, http01-via-Gateway, and dns01 (route53) —
simultaneously or alone. `acmeIssuerEmail` and `awsRegion` are wired from the
`kustomize-environment` ConfigMap (`ACME_ISSUER_EMAIL`, `AWS_REGION`) by the
cert-manager component.

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
    - class: nginx        # covers traefik clusters too - the traefik component's
                          # nginx-compat provider serves class `nginx`.
                          # `- class: traefik` only for a native-provider Traefik.
  gateway:                # shipped default is [] - the envoy-gateway component
    - name: external      # ADDS THIS ENTRY AUTOMATICALLY (with the label below);
      namespace: envoy-gateway-system  # only configure it by hand to override.
      matchLabels:
        use-gateway-solver: "true"
  dns01:                  # shipped default: route53, label-selected. Required
    enabled: true         # during weighted cutovers - see GATEWAY-ADOPTION.md.
    matchLabels:
      use-dns01-solver: "true"
```

Notes:

* **Gateway-only cluster**: `ingress: []` plus a single selector-less gateway
  entry. cert-manager's Gateway API feature flags are enabled automatically by
  the [envoy-gateway component](../../envoy-gateway/) — see
  [GATEWAY-ADOPTION.md](../../../../docs/GATEWAY-ADOPTION.md).
* Certificates opt into a labeled solver by carrying its label
  (`use-gateway-solver`, `use-dns01-solver`); everything else gets the
  selector-less default.
