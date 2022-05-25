#!/bin/bash
set -e

for f in "production" "staging" "development"
do
  # output the sorted config to a tmp file
  jq --sort-keys . "$f.json" > "$f.tmp.json"

  # compare the config to the tmp file
  if cmp "$f.json" "$f.tmp.json"; then
    # files are the same, so remove the tmp file
    /bin/rm "$f.tmp.json"
  else 
    # if we're in CI (set to true for github actions)
    # and the files are different, then fail
    if [ "$CI" == true ]; then
      echo 'Configs not sorted, failing...'
      exit 125
    fi

    # files are different, update the config with the tmp file
    /bin/mv "$f.tmp.json" "$f.json"
  fi
done