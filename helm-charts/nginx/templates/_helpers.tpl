{{- /*
Return the fully qualified app name.
*/ -}}
{{- define "nginx.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- /*
Common labels
*/ -}}
{{- define "nginx.labels" -}}
app.kubernetes.io/name: {{ include "nginx.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- /*
Selector labels for Deployment/Service
*/ -}}
{{- define "nginx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nginx.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
