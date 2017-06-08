# Circleci Use Chrome Stable Version

To force the use of the latest stable version of Chrome on Circle CI, define those lines in your circle.yml configuration file and set enviromental variable REQUIRED_CHROME_VERSION to the version of chrome you want at least

```
dependencies:
  cache_directories:
  - '~/downloads'
pre:
  - if test -f "$HOME/downloads/use_required_chrome.sh"; then bash $HOME/downloads/use_required_chrome.sh; else curl -o $HOME/downloads/use_required_chrome.sh --create-dirs https://raw.githubusercontent.com/jetfault/circleci-google-chrome/master/use_required_chrome.sh && bash $HOME/downloads/use_required_chrome.sh; fi;
