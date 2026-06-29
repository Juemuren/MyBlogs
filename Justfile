[default]
default:
    just --list
server: clean
    hugo server
build: clean
    hugo --cleanDestinationDir
new:
    ./scripts/new-content.sh
clean:
    ./scripts/clean-temp.sh
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
publish-zhihu file: (export-standalone file)
    ./scripts/publish-zhihu.sh "{{ without_extension(file) }}.temp.md"
export-standalone file:
    ./scripts/handle-md.sh "{{ file }}" "{{ without_extension(file) }}.temp.md"
    ./scripts/export-svg.sh "{{ parent_directory(file) }}"
delete-deployments:
    ./scripts/delete-deployments.sh
