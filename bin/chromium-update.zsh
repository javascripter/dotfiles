#!/usr/bin/env zsh

URL="http://build.chromium.org/buildbot/snapshots/chromium-rel-mac"
TMP_PATH="/tmp/chromium"
if [ -e $TMP_PATH ]; then
  rm -rf $TMP_PATH
fi
mkdir $TMP_PATH
cd $TMP_PATH
curl $URL/LATEST -o LATEST --silent
LATEST=`cat LATEST`
curl $URL/$LATEST/chrome-mac.zip -o chromium.zip --silent
unzip -qq chromium.zip
rm -rf /Applications/Chromium.app
mv chrome-mac/Chromium.app /Applications
exit
rm -rf $TMP_PATH
cd -
