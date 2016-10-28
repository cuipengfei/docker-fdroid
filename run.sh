#!/bin/sh

cd /apk
cd /apk && (fdroid init||true)
cd /apk && (fdroid update --create-key||true)
cd /apk && (fdroid update -c||true)
cd /apk && fdroid update
