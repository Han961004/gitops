# templates/_helpers.tpl
{{- define "monitoring-stack.fullname" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "monitoring-stack.labels" -}}
app.kubernetes.io/name: {{ include "monitoring-stack.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
