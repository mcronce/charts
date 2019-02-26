{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "matrix-appservice-webhooks.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "matrix-appservice-webhooks.fullname" -}}
  {{- if .Values.fullnameOverride -}}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- if contains $name .Release.Name -}}
      {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
      {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "matrix-appservice-webhooks.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate chart secret name
*/}}
{{- define "matrix-appservice-webhooks.secretName" -}}
  {{ default (include "matrix-appservice-webhooks.fullname" .) .Values.secret.nameOverride }}
{{- end -}}

{{/*
Generate all the labels for chart-deployed resources
*/}}
{{- define "matrix-appservice-webhooks.labels" -}}
app.kubernetes.io/name: {{ template "matrix-appservice-webhooks.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ template "matrix-appservice-webhooks.chart" . }}
{{- if .Values.extraLabels -}}
{{- toYaml .Values.extraLabels -}}
{{- end -}}
{{- end -}}

{{/*
Produce the URL that the Matrix server will use to access the appservice
*/}}
{{- define "matrix-appservice-webhooks.url" -}}
  {{- .Values.settings.url_override | default (printf "http://%s.%s.svc.cluster.local:%s" (include "matrix-appservice-webhooks.fullname" .) .Release.Namespace .Values.service.port) }}
{{- end }}

