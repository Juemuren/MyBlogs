[default]
default:
  just --list

new type name:
  hugo new content "posts/{{type}}/{{name}}.md"

export-zhihu file:
  pandoc "{{file}}" -o "{{without_extension(file)}}.zhihu.md" \
    -t markdown-smart-simple_tables \
    --lua-filter="scripts/extract-codeblocks.lua" \
    --lua-filter="scripts/shift-headers.lua" \
    --lua-filter="scripts/remove-comments.lua" \
    --wrap=preserve
  ./scripts/export-svg.sh "{{parent_directory(file)}}"

clean-zhihu:
  find . -type f -name "*.zhihu.md" -delete
  find . -type f -name "*-tikz-*" -delete
  find . -type f -name "*-mermaid-*" -delete

delete-deployments:
  ./scripts/delete-deployments.sh
