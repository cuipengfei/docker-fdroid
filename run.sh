#!/bin/sh

cd /apk
fdroid init
fdroid update --create-key
fdroid update -c
fdroid update
