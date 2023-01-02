#!/bin/sh

WORKDIR="/work"
if [ -d $1 ]; then
  WORKDIR=$1 
fi

echo "using $WORKDIR..."
cd $WORKDIR

if [ `jq '.bundleDependencies' package.json` = "null" ]; then
  mv package.json package.json.org 
  jq '. + {"bundleDependencies": "true"}' package.json.org > package.json
fi

npm install --production --verbose
npm pack

if [ -f package.json.org ]; then
  mv package.json.org package.json
fi
