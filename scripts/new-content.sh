#!/bin/sh

gum style \
  --border normal \
  --margin "1 0" \
  --padding "0 1" \
  "Create new content"

category=$(
  gum choose \
    --header "Category" \
    "math" \
    "lit" \
    "phil"
)
title=$(
  gum input \
    --prompt "Title: " \
    --placeholder "New $category post"
)
tags=$(
  gum input \
    --prompt "Tags: " \
    --placeholder "$category, $title"
)
summary=$(
  gum write \
    --header "$category - [$title]: $tags" \
    --placeholder "Summary"
)
draft=$(
  gum choose \
    --header "Draft?" \
    true \
    false
)

yaml_list_from_csv_line() {
  printf "%s\n" "$1" |
  yq 'split(",") | map(trim)' - |
  sed 's/^/  /'
}

path="posts/${category}/${title}.md"

HUGO_TITLE="$title" \
HUGO_CATEGORY="$category" \
HUGO_SUMMARY="$summary" \
HUGO_TAGS="$(yaml_list_from_csv_line "$tags")" \
HUGO_DRAFT="$draft" \
hugo new content "$path"

if gum confirm "Open in $EDITOR?"; then
  $EDITOR "content/${path}"
fi
