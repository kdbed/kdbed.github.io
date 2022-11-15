#! /bin/bash

SRC="./org"
DEST="./convert-test"

SRC_ESCAPED=$(echo $SRC | sed -e 's/\.\//\\.\\\//g')
DEST_ESCAPED=$(echo $DEST | sed -e 's/\//\\\//g')

STATEMENT="s/^$SRC_ESCAPED/$DEST_ESCAPED/"

# Create mirror'd folder structure at destination
find "$SRC" -type d -exec sh -c 'echo $1 | sed -e "$0" | xargs -I}{ mkdir -p "}{"' "$STATEMENT" {} \;

# Convert each org file to markdown in the destination folder structure
find "$SRC" -iregex ".*org" -exec sh -c 'echo $1 | sed -e "s/\.org$/\.md/" -e "$0" | xargs -I}{ pandoc -s --wrap=none -f org --toc -t gfm $1 -o }{' "$STATEMENT" {} \;
