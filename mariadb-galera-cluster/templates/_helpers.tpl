{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "mariadb-galera-cluster.name" -}}
{{- default "mgc" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "mariadb-galera-cluster.fullname" -}}
{{- $name := default "mgc" .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Create a short cluster name in order to fulfill Percona's `wsrep_cluster_name` variable max size.
https://www.percona.com/doc/mariadb-galera-cluster/LATEST/wsrep-system-index.html#wsrep_cluster_name
*/}}
{{- define "mariadb-galera-cluster.shortname" -}}
{{- $name := default "mgc" .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 32 | trimSuffix "-" -}}
{{- end -}}

{{- define "mariadb-galera-cluster.statefulset.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "apps/v1/StatefulSet" -}}
{{- print "apps/v1" -}}
{{- else -}}
{{- print "apps/v1beta2" -}}
{{- end -}}
{{- end -}}

{{- define "mariadb-galera-cluster.gen-certs" -}}
{{- $altNames := list ( printf "%s.%s" (include "mariadb-galera-cluster.name" .) .Release.Namespace ) ( printf "%s.%s.svc" (include "mariadb-galera-cluster.name" .) .Release.Namespace ) -}}
{{- $ca := genCA "mariadb-galera-cluster-ca" 365 -}}
{{- $cert := genSignedCert ( include "mariadb-galera-cluster.name" . ) nil $altNames 365 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
{{- end -}}