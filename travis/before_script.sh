#!/bin/sh
set -e

brew update

brew install swiftlint || brew outdated swiftlint || brew upgrade swiftlint

# workaround for Travis bug https://github.com/travis-ci/travis-ci/issues/7031
# remove duplicated iPhone 7 simulator
xcrun simctl delete E40727B3-41FB-4D6E-B4CB-BFA87109EB12
