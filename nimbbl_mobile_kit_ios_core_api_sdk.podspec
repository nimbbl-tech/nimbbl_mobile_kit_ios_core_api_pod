Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.0.6"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS."
  spec.homepage     = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_sdk"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tech@nimbbl.biz" }
  
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => spec.version }

  # Use static library to avoid embedding issues
  spec.static_framework = true
  
  # Static library and headers
  spec.vendored_libraries = "static_lib/libnimbbl_mobile_kit_ios_core_api_sdk.a"
  spec.source_files = "static_lib/Headers/*.h"
  spec.public_header_files = "static_lib/Headers/*.h"

  # No source code compilation
  spec.requires_arc = false

  # Configure build settings for static library
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'MACH_O_TYPE' => 'staticlib',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'NO',
    'ENABLE_BITCODE' => 'NO',
    'CODE_SIGNING_ALLOWED' => 'NO',
    'CODE_SIGNING_REQUIRED' => 'NO',
    'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO',
    'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO'
  }
  
  # User target configuration to prevent embedding
  spec.user_target_xcconfig = {
    'MACH_O_TYPE' => 'staticlib',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'NO',
    'ENABLE_BITCODE' => 'NO',
    'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO',
    'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO',
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited)',
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
