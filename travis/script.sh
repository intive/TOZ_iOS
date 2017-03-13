#!/bin/sh
set -e -o pipefail

PLATFORM="platform=iOS Simulator,OS=10.2,name=iPhone 7"
WORKSPACE="TOZ_iOS.xcworkspace"
SCHEME="TOZ_iOS"

xctool \
    -workspace "$WORKSPACE" \
    -scheme "$SCHEME" \
	-destination "$PLATFORM" \
	run-tests
