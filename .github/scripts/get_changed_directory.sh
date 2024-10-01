#!/bin/bash

dirs=$(git diff --name-only origin/main...HEAD | grep '/' | grep '\.tf$' | cut -d '/' -f1,2 | sort -u)

filtered_dirs=$(echo "$dirs" | jq -R -s -c 'split("\n")[:-1]')
echo "$filtered_dirs"
