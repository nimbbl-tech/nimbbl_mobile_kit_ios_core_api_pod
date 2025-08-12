#!/bin/bash

# Script to rebuild XCFramework with proper header files
set -e

echo "🔧 Rebuilding XCFramework with header files..."

# Remove existing XCFramework
rm -rf nimbbl_mobile_kit_ios_core_api_sdk.xcframework

# Create XCFramework with proper structure including headers
xcodebuild -create-xcframework \
  -framework nimbbl_mobile_kit_ios_core_api_sdk.framework \
  -output nimbbl_mobile_kit_ios_core_api_sdk.xcframework

echo "✅ XCFramework rebuilt successfully!"

# Verify the structure
echo "📋 Verifying XCFramework structure..."
find nimbbl_mobile_kit_ios_core_api_sdk.xcframework -name "*.h" -o -name "module.modulemap"

echo "🎉 XCFramework rebuild complete!"
