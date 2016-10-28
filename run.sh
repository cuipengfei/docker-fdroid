#!/bin/sh

cd /apk
tree
pwd
fdroid init
pwd
fdroid update --create-key
pwd
fdroid update -c
pwd
fdroid update
