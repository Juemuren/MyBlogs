[default]
default:
  just --list

zhihu file:
  pandoc "{{file}}" -t markdown-smart -o "{{without_extension(file)}}.zhihu.md" \
    --lua-filter="scripts/shift-headers.lua" \
    --wrap=preserve

clean:
  find . -type f -name "*.zhihu.md" -delete