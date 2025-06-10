{{- define "loki.fullname" -}}
{{ .Release.Name }}-loki
{{- end -}}

{{- define "loki.labels" -}}
app.kubernetes.io/name: {{ include "loki.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
