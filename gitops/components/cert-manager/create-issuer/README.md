# create-issuer

Renders the `letsencrypt` `ClusterIssuer` with **composable ACME solvers**:
any mix of http01-via-Ingress (nginx, traefik, ...), http01-via-Gateway
(envoy-gateway / Gateway API), and dns01 (route53) — simultaneously or alone.

## How solver selection works

cert-manager picks **one solver per Certificate**, choosing the entry whose
`selector` matches most specifically (`matchLabels` on the Certificate/Ingress,
or `dnsZones` against the hostname). An entry with **no** `matchLabels`/
`dnsZones` is the default/catch-all — the chart fails rendering if more than
one entry is selector-less.

## Values

```yaml
solvers:
  ingress:              # one http01 Ingress solver per entry
    - class: nginx      # selector-less -> the default solver
  gateway:              # one http01 gatewayHTTPRoute solver per entry
    - name: eg
      namespace: envoy-gateway-system
      matchLabels:
        use-gateway-solver: "true"
  dns01:                # route53; region comes from awsRegion
    enabled: true
    matchLabels:
      use-dns01-solver: "true"
```

`acmeIssuerEmail` and `awsRegion` are wired from the `kustomize-environment`
ConfigMap (`ACME_ISSUER_EMAIL`, `AWS_REGION`) by the cert-manager component.

## Recipes

* **Default (nginx-served Ingress + labeled dns01)** — the shipped values.
  Note the [`traefik`](../../traefik/README.md) component serves class `nginx`
  via its nginx-compat provider, so this default also covers traefik-only
  clusters unchanged.
* **All three at once** — keep the nginx default entry, add labeled entries;
  Certificates opt into a specific solver via labels:

  ```yaml
  solvers:
    ingress:
      - class: nginx
    gateway:
      - name: eg
        namespace: envoy-gateway-system
        matchLabels:
          use-gateway-solver: "true"
    dns01:
      enabled: true
      matchLabels:
        use-dns01-solver: "true"
  ```

* **Envoy Gateway only** — a single selector-less gateway entry
  (`ingress: []`, `dns01.enabled` as desired). Requires cert-manager's
  `config.enableGatewayAPI` — see
  [GATEWAY-ADOPTION.md](../../../../docs/GATEWAY-ADOPTION.md).
* **Native-Traefik class** — only when running Traefik's native provider
  (not the nginx-compat mode this repo defaults to): `- class: traefik`.
* **dns01 routing** — label Certificates `use-dns01-solver: "true"` (as
  today), or replace `matchLabels` with `dnsZones` to route whole zones.

## Migration from the previous values schema

| Old | New |
|---|---|
| `ingressClassName: X` | `solvers.ingress: [{class: X}]` |
| `gateway: {enabled: true, name: N, namespace: NS}` | `solvers.gateway: [{name: N, namespace: NS}]` |
| dns01 (always on, labeled) | `solvers.dns01: {enabled: true, matchLabels: {use-dns01-solver: "true"}}` |
