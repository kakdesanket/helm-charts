{{/*
    Expand the name of the chart.
*/}}
{{- define "cloudneeti-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
    Create chart name and version as used by the chart label.
*/}}
{{- define "cloudneeti-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}