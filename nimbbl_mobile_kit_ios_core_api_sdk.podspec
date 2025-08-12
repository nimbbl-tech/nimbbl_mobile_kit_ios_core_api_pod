Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.0.5"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS."
  spec.homepage     = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_sdk"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tech@nimbbl.biz" }
  
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_sdk.git", :tag => spec.version }

  # Prebuilt binary framework
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.xcframework"

  # Ensures linking doesn’t force dynamic frameworks
  spec.static_framework = true

  # No source code compilation
  spec.requires_arc = false

  # Compatible architectures
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end
