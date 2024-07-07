#!/bin/bash
# Remove the old /archives folder
rm -rf archives
# iOS Simulators
xcodebuild -quiet archive \
    -scheme BasicFunctions \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "archives/BasicFunctions-iOS-simulator.xcarchive" \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES
# iOS Devices
xcodebuild -quiet archive \
    -scheme BasicFunctions \
    -archivePath "archives/BasicFunctions-iOS.xcarchive" \
    -destination "generic/platform=iOS" \
    -sdk iphoneos \
    ONLY_ACTIVE_ARCH=NO \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES
# Build BasicFunctions.xcframework
xcodebuild -create-xcframework \
    -framework "archives/BasicFunctions-iOS.xcarchive/Products/Library/Frameworks/BasicFunctions.framework" \
    -framework "archives/BasicFunctions-iOS-simulator.xcarchive/Products/Library/Frameworks/BasicFunctions.framework" \
    -output "archives/BasicFunctions.xcframework"
