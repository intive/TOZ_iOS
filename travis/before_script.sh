#!/bin/sh
set -e

brew update

brew install swiftlint || brew outdated swiftlint || brew upgrade swiftlint
# brew install xctool || brew outdated xctool || brew upgrade xctool
brew uninstall --force xctool
brew install --HEAD xctool