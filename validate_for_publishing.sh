#!/bin/bash

# Script to validate frameworks before publishing to CocoaPods

set -e

echo "🔍 Validating framework for publishing..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Validate framework
framework_path="nimbbl_mobile_kit_ios_core_api_sdk.framework"

if [ ! -d "$framework_path" ]; then
    print_error "Framework not found: $framework_path"
    exit 1
fi

print_status "Validating framework structure..."

# Check required files
required_files=("Info.plist" "Headers" "Modules")
for file in "${required_files[@]}"; do
    if [ ! -e "$framework_path/$file" ]; then
        print_error "Missing required file/directory: $file"
        exit 1
    fi
done

# Check binary
binary_name=$(plutil -extract CFBundleExecutable raw "$framework_path/Info.plist" 2>/dev/null)
if [ -z "$binary_name" ]; then
    binary_name="nimbbl_mobile_kit_ios_core_api_sdk"
fi

binary_path="$framework_path/$binary_name"
if [ ! -f "$binary_path" ]; then
    print_error "Missing binary: $binary_name"
    exit 1
fi

print_success "Framework structure is valid"

# Check code signatures
print_status "Checking code signatures..."

if [ -d "$framework_path/_CodeSignature" ]; then
    print_error "Framework contains _CodeSignature folder"
    exit 1
fi

if ! codesign -dv "$binary_path" 2>&1 | grep -q "not signed"; then
    print_error "Binary is still signed"
    exit 1
fi

print_success "Framework is unsigned"

# Check architectures
print_status "Checking architectures..."

architectures=$(lipo -info "$binary_path" 2>/dev/null | cut -d: -f3)
print_status "Architectures: $architectures"

if echo "$architectures" | grep -q "x86_64" && echo "$architectures" | grep -q "arm64"; then
    print_success "Framework is universal (x86_64 + arm64)"
else
    print_error "Framework is not universal"
    exit 1
fi

# Check podspec
print_status "Validating podspec..."

if [ ! -f "nimbbl_mobile_kit_ios_core_api_sdk.podspec" ]; then
    print_error "Podspec not found"
    exit 1
fi

# Quick podspec validation
if pod spec lint nimbbl_mobile_kit_ios_core_api_sdk.podspec --quick --allow-warnings > /dev/null 2>&1; then
    print_success "Podspec validation passed"
else
    print_error "Podspec validation failed"
    exit 1
fi

print_success "✅ Framework is ready for publishing!"
echo ""
print_status "📋 Summary:"
print_status "- Framework structure: ✅ Valid"
print_status "- Code signatures: ✅ Removed"
print_status "- Architectures: ✅ Universal (x86_64 + arm64)"
print_status "- Podspec: ✅ Valid"
echo ""
print_status "Ready to publish to CocoaPods!"
