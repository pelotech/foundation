# Grafana K8s monitoring

[docs](https://grafana.com/docs/grafana-cloud/monitor-infrastructure/kubernetes-monitoring/configuration/helm-chart-config/)
[chart](https://github.com/grafana/k8s-monitoring-helm/tree/main/charts/k8s-monitoring)

The Grafana k8s monitoring helm chart deploys the infrastructure necessary to enable the Grafana Cloud Kubenretes Integration dashboards and alerts.

**NOTE: This only works for Grafana Cloud; not self-hosted Grafana.**

## Required kustomize-environment vars
* `CLUSTER_NAME`
* `PROMETHEUS_ENDPOINT`
* `LOKI_ENDPOINT`
* `TEMPO_ENDPOINT`

The 3 endpoints can be found in your `Grafana Cloud > Infrastructure > Kubernetes > Configuration page.`

## Required secrets
The following secrets must be installed in the `grafana-k8s-monitoring` namespace and include the credentials
for each destination. The 3 required secrets should be named:
* `prometheus`
* `loki`
* `tempo`

Each secret needs the username/password generated from the [token section of the Configuration page](https://grafana.com/docs/grafana-cloud/monitor-infrastructure/kubernetes-monitoring/configuration/helm-chart-config/#use-a-grafanacom-access-policy-token).
The username for each destination is visible in the template yaml generated on that page, and they should all share the same token you generated.

Here's an example secret for the prometheus destination:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: prometheus-k8s-monitoring
  namespace: grafana
data:
  username: "1168926"
  password: <SECRET_TOKEN>
```
## Default features
Metrics, cluster events, and logs are enabled by default. Application monitoring and the
Prometheus Operator are disabled by default, but default values for them are present for convenience.

## Metrics Tuning
The helm values in this component include metrics tuning that minimize metrics cost.  *Some*
dashboards and alerts will not work due to these tuning adjustments, but the vast majority of
the integration still works and significantly reduces cost by 2-3x compared to the chart's
default configuration.

