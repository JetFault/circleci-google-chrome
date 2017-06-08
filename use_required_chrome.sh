#!/bin/bash

#compare versions
verlte() {
  [ "$1" = "`echo -e \"$1\n$2\" | sort -V | head -n1`" ]
}

use_chrome_stable_version() {
  echo "Upgrading the current Chrome version: `google-chrome --version`"
  cd $HOME/downloads
  if ! test -f "google-chrome.deb"; then
    curl -L -o google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  fi
  sudo dpkg -i google-chrome.deb
  sudo sed -i 's|HERE/chrome\"|HERE/chrome\" --disable-setuid-sandbox|g' /opt/google/chrome/google-chrome
  echo "Updated Chrome to version: `google-chrome --version`"
}

CURRENT_CHROME_VERSION="`google-chrome --version | sed 's/Google Chrome //'`"

# If current installed chrome is too low, then install latest stable
verlte $CURRENT_CHROME_VERSION $REQUIRED_CHROME_VERSION && use_chrome_stable_version
