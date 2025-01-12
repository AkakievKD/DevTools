# templates/_helpers.tpl
{{- define "custom.appValues" -}}
{{- with . -}}
{{- toYaml . }}
{{- end -}}
{{- end -}}

{{- define "fullname" -}}
{{- if .Values.appName -}}
{{- .Values.appName | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "fullnamespace" -}}
{{- if .Values.namespace -}}
{{- .Values.namespace | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}