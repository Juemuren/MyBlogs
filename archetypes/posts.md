---
title: {{ getenv `HUGO_TITLE` }}
date: {{ .Date }}
categories: {{ getenv `HUGO_CATEGORY` }}
{{- with getenv `HUGO_TAGS` }}
tags:
{{ . }}
{{- end }}
summary: {{ getenv `HUGO_SUMMARY` }}
draft: true
---
