#!/bin/sh

gum style \
  --border normal \
  --margin "1 0" \
  --padding "0 1" \
  "Create new content"

kind=$(
  gum choose \
    --header "Kind" \
    "art" \
    "cs" \
    "math" \
    "nov" \
    "phil"
)
title=$(
  gum input \
    --prompt "Title: " \
    --placeholder "New $kind post"
)
tags=$(
  gum input \
    --prompt "Tags: " \
    --placeholder "$kind, $title"
)
summary=$(
  gum write \
    --header "$kind - [$title]: $tags" \
    --placeholder "Summary"
)

yaml_list_from_csv_line() {
  printf "%s\n" "$1" |
  yq 'split(",") | map(trim)' - |
  sed 's/^/  /'
}

path="posts/${kind}/${title}.md"

HUGO_TITLE="$title" \
HUGO_SUMMARY="$summary" \
HUGO_TAGS="$(yaml_list_from_csv_line "$tags")" \
hugo new content --kind "$kind" "$path"

if gum confirm "Open in $EDITOR?"; then
  $EDITOR "content/${path}"
fi
