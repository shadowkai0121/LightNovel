#!/bin/bash

IFS=$'\n'
find . -type f -name "book.yml" -print0 | while IFS= read -r -d '' file; do
    dir=$(dirname "$file")
    echo "$dir"
    cd $dir && pandoc -d book.yml && cd ..
done