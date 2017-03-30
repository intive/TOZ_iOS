# Make sure we're failing even though we pipe to xcpretty
SHELL=/bin/bash -o pipefail -o errexit

# iPhone7, iOS10.3
DEVICE_UUID:=$(shell xcrun instruments -s | grep -m 1 -o "iPhone 7 (10.3) \[.*\]" | grep -o "\[.*\]" | sed "s/^\[\(.*\)\]$$/\1/")
BUILD_DESTINATION = platform=iOS Simulator,id=${DEVICE_UUID}
WORKING_DIR = ./
SCHEME = TOZ_iOS
XCODE_BUILD = xcrun xcodebuild -workspace $(SCHEME).xcworkspace -scheme $(SCHEME) -sdk iphonesimulator

.PHONY: build test retest clean

default: test

ci: test

build: 
	cd $(WORKING_DIR) && \
		$(XCODE_BUILD) build | xcpretty

test: optional_early_start_simulator
	cd $(WORKING_DIR) && \
		$(XCODE_BUILD) \
			-destination '${BUILD_DESTINATION}' \
			test | xcpretty

clean:
	cd $(WORKING_DIR) && \
		$(XCODE_BUILD) \
			clean | xcpretty

optional_early_start_simulator:
ifdef EARLY_START_SIMULATOR
		echo "Waiting for simulator to start to help with testing timeouts" &&\
		xcrun instruments -w '${DEVICE_UUID}' || true # xcrun can return irrelevant non-zeroes.
else
		echo "Not waiting for simulator."
endif
