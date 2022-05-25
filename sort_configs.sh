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
    # files are different, update the config with the tmp file
    /bin/mv "$f.tmp.json" "$f.json"
  fi
done