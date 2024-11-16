{{/*
Generate a fullname for the chart
*/}}
{{- define "wordpress.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{/*
Generate a short name for the chart
*/}}
{{- define "wordpress.name" -}}
{{ .Release.Name }}
{{- end }}

{{/*
Generate common Kubernetes labels
*/}}
{{- define "wordpress.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Generate the name for the ServiceAccount
*/}}
{{- define "wordpress.serviceAccountName" -}}
{{- if .Values.serviceAccount.name -}}
{{ .Values.serviceAccount.name }}
{{- else -}}
{{ include "wordpress.fullname" . }}
{{- end -}}
{{- end }}

{{/*
Generate selector labels for a deployment
*/}}
{{- define "wordpress.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}
