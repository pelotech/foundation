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

{{/*
Fail rendering on invalid solver combinations: at least one solver must be
configured, and at most one entry across all solver types may omit selectors
(that entry is the default/catch-all — more than one is ambiguous).
*/}}
{{- define "create-issuer.validate" -}}
{{- $entries := concat (.Values.solvers.ingress | default list) (.Values.solvers.gateway | default list) -}}
{{- if .Values.solvers.dns01.enabled -}}
{{- $entries = append $entries .Values.solvers.dns01 -}}
{{- end -}}
{{- if not $entries -}}
{{- fail "no solvers configured: set at least one of solvers.ingress, solvers.gateway, solvers.dns01.enabled" -}}
{{- end -}}
{{- $defaults := 0 -}}
{{- range $entries -}}
{{- if not (or .matchLabels .dnsZones) -}}{{- $defaults = add1 $defaults -}}{{- end -}}
{{- end -}}
{{- if gt $defaults 1 -}}
{{- fail "ambiguous default solver: at most one solver entry may omit matchLabels/dnsZones" -}}
{{- end -}}
{{- end }}

{{/*
Render a solver selector block from an entry's matchLabels / dnsZones.
Renders nothing when the entry has neither (the default/catch-all solver).
*/}}
{{- define "create-issuer.solverSelector" -}}
{{- if or .matchLabels .dnsZones }}
selector:
  {{- with .matchLabels }}
  matchLabels:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .dnsZones }}
  dnsZones:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- end }}
