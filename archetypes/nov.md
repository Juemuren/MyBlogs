---
title: {{ getenv `HUGO_TITLE` }}
date: {{ .Date }}
categories: 小说
{{- with getenv `HUGO_TAGS` }}
tags:
{{ . }}
{{- end }}
summary: {{ getenv `HUGO_SUMMARY` }}
draft: true
---
