#!/bin/bash

input=$1
output=$2

# pandoc "$input" -o "$output" \
#     --standalone \
#     --from markdown \
#     --to markdown-smart-simple_tables-raw_attribute \
#     --lua-filter="scripts/extract-codeblocks.lua" \
#     --lua-filter="scripts/shift-headers.lua" \
#     --lua-filter="scripts/remove-comments.lua" \
#     --lua-filter="scripts/convert-math.lua" \
#     --wrap=preserve

pandoc "$input" -o "$output" \
    --to markdown-smart-simple_tables-grid_tables-multiline_tables-raw_attribute \
    --lua-filter="scripts/extract-codeblocks.lua" \
    --lua-filter="scripts/shift-headers.lua" \
    --lua-filter="scripts/remove-comments.lua" \
    --wrap=preserve
