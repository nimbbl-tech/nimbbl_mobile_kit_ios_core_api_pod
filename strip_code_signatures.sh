#!/bin/bash

# Script to strip code signatures from frameworks before publishing
# This ensures frameworks are unsigned and ready for distribution

echo "🔧 Stripping code signatures from frameworks..."

# Function to strip code signatures from a framework
strip_framework() {
    local framework_path="$1"
    local framework_name=$(basename "$framework_path")
    
    echo "Processing: $framework_name"
    
    # Remove _CodeSignature folder if it exists
    if [ -d "$framework_path/_CodeSignature" ]; then
        echo "  Removing _CodeSignature folder..."
        rm -rf "$framework_path/_CodeSignature"
    fi
    
    # Get the binary name from Info.plist
    local binary_name=$(plutil -extract CFBundleExecutable raw "$framework_path/Info.plist" 2>/dev/null)
    if [ -z "$binary_name" ]; then
        # Fallback to framework name without .framework extension
        binary_name="${framework_name%.framework}"
    fi
    
    local binary_path="$framework_path/$binary_name"
    
    if [ -f "$binary_path" ]; then
        echo "  Stripping code signatures from binary: $binary_name"
        
        # Remove code signatures from the binary
        codesign --remove-signature "$binary_path" 2>/dev/null
        
        # Verify the binary is unsigned
        if codesign -dv "$binary_path" 2>&1 | grep -q "not signed"; then
            echo "  ✅ Binary is now unsigned"
        else
            echo "  ⚠️  Warning: Binary may still have signatures"
        fi
    else
        echo "  ⚠️  Warning: Binary not found at $binary_path"
    fi
    
    echo ""
}

# Process the current framework
if [ -d "nimbbl_mobile_kit_ios_core_api_sdk.framework" ]; then
    strip_framework "nimbbl_mobile_kit_ios_core_api_sdk.framework"
fi

# Process any other frameworks in the directory
for framework in *.framework; do
    if [ -d "$framework" ] && [ "$framework" != "nimbbl_mobile_kit_ios_core_api_sdk.framework" ]; then
        strip_framework "$framework"
    fi
done

echo "✅ Code signature stripping complete!"
echo ""
echo "📋 Summary:"
echo "- All _CodeSignature folders removed"
echo "- All binaries stripped of code signatures"
echo "- Frameworks are now ready for distribution"
