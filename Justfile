[default]
default:
  just --list

server: (clean-zhihu)
  hugo server

build: (clean-zhihu)
  hugo --cleanDestinationDir

new type name:
  hugo new content "posts/{{type}}/{{name}}.md"

publish-zhihu file: (export-zhihu file)
  source .env && \
  wechatsync sync "{{without_extension(file)}}.zhihu.md" -p zhihu

export-zhihu file:
  pandoc "{{file}}" -o "{{without_extension(file)}}.zhihu.md" \
    --standalone \
    --from markdown \
    --to markdown-smart-simple_tables \
    --lua-filter="scripts/extract-codeblocks.lua" \
    --lua-filter="scripts/shift-headers.lua" \
    --lua-filter="scripts/remove-comments.lua" \
    --wrap=preserve
  ./scripts/export-svg.sh "{{parent_directory(file)}}"

clean-zhihu:
  fd --no-ignore-vcs \
    --type file ".*\.zhihu\.md|.*-(tikz|mermaid)-.*" \
    --exec-batch rm

delete-deployments:
  ./scripts/delete-deployments.sh
