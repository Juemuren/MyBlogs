[default]
default:
  just --list

export-zhihu file:
  pandoc "{{file}}" -t markdown-smart -o "{{without_extension(file)}}.zhihu.md" \
    --lua-filter="scripts/shift-headers.lua" \
    --wrap=preserve

clean-zhihu:
  find . -type f -name "*.zhihu.md" -delete

delete-deployments:
  ./scripts/delete-deployments.sh
