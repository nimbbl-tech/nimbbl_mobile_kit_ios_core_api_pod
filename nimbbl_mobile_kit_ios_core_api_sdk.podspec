Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.0.5"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS."
  spec.homepage     = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_sdk"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tech@nimbbl.biz" }
  
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => spec.version }

  # Prebuilt binary framework
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.xcframework"

  # Configure for automatic integration without embedding issues
  spec.static_framework = false
  
  # No source code compilation
  spec.requires_arc = false

  # Configure build settings to prevent embedding issues
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO',
    'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO',
    'FRAMEWORK_SEARCH_PATHS' => ['$(inherited)', '$(PODS_ROOT)/nimbbl_mobile_kit_ios_core_api_sdk']
  }
  
  # User target configuration to prevent embedding
  spec.user_target_xcconfig = {
    'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO',
    'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO'
  }
end
