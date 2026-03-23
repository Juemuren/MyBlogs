[default]
default:
  just --list

new type name:
  hugo new content "posts/{{type}}/{{name}}.md"

export-zhihu file:
  pandoc "{{file}}" -t markdown-smart -o "{{without_extension(file)}}.zhihu.md" \
    --lua-filter="scripts/shift-headers.lua" \
    --wrap=preserve

clean-zhihu:
  find . -type f -name "*.zhihu.md" -delete

delete-deployments:
  ./scripts/delete-deployments.sh
