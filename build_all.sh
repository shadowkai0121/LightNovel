#!/bin/bash

git submodule update --init --recursive

curl -s https://raw.githubusercontent.com/shadowkai0121/zh_tw_correct/refs/heads/master/correct.py | py - 'https://raw.githubusercontent.com/shadowkai0121/zh_tw_correct/refs/heads/master/DICTIONARY' -c correct.txt

IFS=$'\n'
find . -type f -name "book.yml" -print0 | while IFS= read -r -d '' file; do
    dir=$(dirname "$file")
    echo "$dir"
    cd $dir && pandoc -d book.yml && cd ..
done