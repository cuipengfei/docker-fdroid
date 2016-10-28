#!/bin/sh

cd /apk
pwd
fdroid init
pwd
fdroid update --create-key
pwd
fdroid update -c
pwd
fdroid update
