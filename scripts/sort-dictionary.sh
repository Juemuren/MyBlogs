#!/bin/sh

path=$1

fd --search-path "$path" --exec sh -c "sort {} --output {}"
