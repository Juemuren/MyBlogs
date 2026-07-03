---
title: {{ getenv `HUGO_TITLE` }}
date: {{ .Date }}
categories: 艺术鉴赏
{{- with getenv `HUGO_TAGS` }}
tags:
{{ . }}
{{- end }}
summary: {{ getenv `HUGO_SUMMARY` }}
draft: true
---
