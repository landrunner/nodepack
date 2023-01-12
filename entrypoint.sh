#!/bin/bash

WORKDIR="/work"
if [ -n "$1" ] && [ -d $1 ]; then
  WORKDIR=$1 
fi
echo "using $WORKDIR..."
cd $WORKDIR

bundleDep=`jq '.bundleDependencies' package.json`
if [[ "$bundleDep" == "null" ]]; then
  mv package.json package.json.org 
  jq '. + {"bundleDependencies": true}' package.json.org > package.json
fi

if [ "$type" == "ts" ]; then
  echo "set files as typescript"
  npm install --verbose
  tsc
else
  echo "set files as javascript"
  npm install --omit=dev --verbose
fi

npm pack --omit=dev --verbose

if [ -f package.json.org ]; then
  mv package.json.org package.json
fi
