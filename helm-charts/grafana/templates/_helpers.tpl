{{- define "grafana.fullname" -}}
{{ .Release.Name }}-grafana
{{- end -}}

{{- define "grafana.labels" -}}
app.kubernetes.io/name: {{ include "grafana.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
