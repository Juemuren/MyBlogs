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
    autocorrect content --lint
    rumdl check content
spell-check:
    typos content
    cspell lint content
    # ltex-cli-plus --client-configuration .ltex.json content
sort-dictionary:
    ./scripts/sort-dictionary.sh .cspell
    ./scripts/sort-dictionary.sh .ltex
publish-zhihu file: (export-zhihu file)
    ./scripts/publish-zhihu.sh "{{ without_extension(file) }}.zhihu.md"
export-zhihu file:
    ./scripts/handle-md.sh "{{ file }}" "{{ without_extension(file) }}.zhihu.md"
    ./scripts/export-svg.sh "{{ parent_directory(file) }}"
clean-zhihu:
    fd --no-ignore-vcs \
        --type file ".*\.zhihu\.md|.*-(tikz|mermaid)-.*" \
        --exec-batch rm
delete-deployments:
    ./scripts/delete-deployments.sh
