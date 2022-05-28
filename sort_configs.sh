#!/bin/bash
set -e

for f in "production" "staging" "development"
do
  # sort array and object keys alphabetically
  jq 'walk( if type == "array" then sort else . end )' --sort-keys "$f.json" |
    # move version and networks to top of json and write to tmp file
    jq '. as $in | {version,networks} + $in' > "$f.tmp.json" 
      

  # compare the config to the tmp file
  if cmp "$f.json" "$f.tmp.json"; then
    # files are the same, so remove the tmp file
    rm "$f.tmp.json"
  else 
    # if we're in CI (set to true for github actions)
    # and the files are different, then fail
    if [ "$CI" == true ]; then
      echo 'Configs not sorted, failing...'
      exit 125
    fi

    # files are different, update the config with the tmp file
    mv "$f.tmp.json" "$f.json"
  fi
done