# Circleci Use Chrome Stable Version

Checks `REQUIRED_CHROME_VERSION` environment variable to see if it needs to update Chrome

Note: This will install the latest stable version of chrome.

Add this to your CircleCI file
```
dependencies:
  cache_directories:
  - '~/downloads'
pre:
  - if test -f "$HOME/downloads/use_required_chrome.sh"; then bash $HOME/downloads/use_required_chrome.sh; else curl -o $HOME/downloads/use_required_chrome.sh --create-dirs https://raw.githubusercontent.com/jetfault/circleci-google-chrome/master/use_required_chrome.sh && bash $HOME/downloads/use_required_chrome.sh; fi;
