#!/bin/sh

cd /apk
tree

echo "@@@ init"
fdroid init
tree

echo "@@@ create key"
fdroid update --create-key
tree

echo "@@@ update-c"
fdroid update -c
tree

echo "@@@ update"
fdroid update
tree
