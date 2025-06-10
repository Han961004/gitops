{{- define "prometheus.fullname" -}}
{{ .Release.Name }}-prometheus
{{- end -}}

{{- define "prometheus.labels" -}}
app.kubernetes.io/name: {{ include "prometheus.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
