[default]
default:
    just --list
server: clean-zhihu
    hugo server
build: clean-zhihu
    hugo --cleanDestinationDir
new type name:
    hugo new content "posts/{{ type }}/{{ name }}.md"
check:
    typos content
    autocorrect content --lint
    rumdl check content
publish-zhihu file: (export-zhihu file)
    source .env && \
    wechatsync sync "{{ without_extension(file) }}.zhihu.md" -p zhihu
export-zhihu file:
    ./scripts/handle-md.sh "{{ file }}" "{{ without_extension(file) }}.zhihu.md"
    ./scripts/export-svg.sh "{{ parent_directory(file) }}"
clean-zhihu:
    fd --no-ignore-vcs \
        --type file ".*\.zhihu\.md|.*-(tikz|mermaid)-.*" \
        --exec-batch rm
delete-deployments:
    ./scripts/delete-deployments.sh
