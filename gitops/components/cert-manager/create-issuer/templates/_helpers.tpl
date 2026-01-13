{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "create-issuer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "create-issuer.labels" -}}
helm.sh/chart: {{ include "create-issuer.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
