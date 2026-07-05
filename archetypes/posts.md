---
title: {{ getenv `HUGO_TITLE` }}
slug: {{ getenv `HUGO_SLUG` }}
date: {{ .Date }}
categories: {{ getenv `HUGO_CATEGORY` }}
{{- with getenv `HUGO_TAGS` }}
tags:
{{ . }}
{{- end }}
summary: {{ getenv `HUGO_SUMMARY` }}
draft: true
---
