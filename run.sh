#!/bin/sh

# refresh the repo whenever there is a apk file change

while file=$(inotifywait -e delete -e close --format "%w%f" /apk/repo/); do
  EXT=${file##*.}

  if [ $EXT = "apk" ]
  then
    echo "detected apk file change"
    echo $file

    echo "@@@ start refreshing repo"
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

  fi
done
