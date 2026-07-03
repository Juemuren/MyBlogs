---
title: {{ getenv `HUGO_TITLE` }}
date: {{ .Date }}
math: true
categories: 数学
{{- with getenv `HUGO_TAGS` }}
tags:
{{ . }}
{{- end }}
summary: {{ getenv `HUGO_SUMMARY` }}
draft: true
---
