#!/bin/sh

# keep refreshing the repo indefinitely
i=1
while [ "$i" -ne 0 ]
do

  echo "@@@ start"
  date

  cd /apk

  echo "@@@ init"
  fdroid init

  echo "@@@ create key"
  fdroid update --create-key

  echo "@@@ update-c"
  fdroid update -c

  echo "@@@ update"
  fdroid update
  tree

  echo "@@@ end"
  date

  sleep 60
done
