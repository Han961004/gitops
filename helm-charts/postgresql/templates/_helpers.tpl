{{/* Define "app.name" */}}
{{- define "app.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/* Define "app.fullname" */}}
{{- define "app.fullname" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}
