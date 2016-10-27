#!/bin/sh

cd /apk && fdroid init || true && fdroid update --create-key || true && fdroid update -c && fdroid update
