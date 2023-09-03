#!/usr/bin/env bash

# Installs latest reporter state, including added dependencies

# Copy over the package and install
# Expects to be run from within ./mock
install_reporter() {

  if [ ! -f ../package.json ] || [ ! -e ../mock ]; then
    echo "Please run this script from within the mock directory"
    exit 1
  fi

  [ ! -f package.json ] && ln -s ./../package.json ./package.json

  if [ -e node_modules ]; then
    echo "Removing old node_modules..."
    rm -r node_modules
  fi

  echo "Symlinking parent node_modules..."
  mkdir -p node_modules/eth-gas-reporter

  ln -s ../node_modules/* node_modules

  echo "Copying over gas-reporter package..."
  cp -r ./../lib node_modules/eth-gas-reporter
  cp ./../index.js node_modules/eth-gas-reporter/index.js
  cp ./../codechecks.js node_modules/eth-gas-reporter/codechecks.js
  cp ./../package.json node_modules/eth-gas-reporter/package.json

}
