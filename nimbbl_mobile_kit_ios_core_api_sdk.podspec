Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.0.5"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS."
  spec.homepage     = "https://nimbbl.biz"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "support@nimbbl.biz" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => "#{spec.version}" }
  spec.swift_version = "5.0"

  # Framework source
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.framework"

  # Required frameworks
  spec.frameworks = ["Foundation", "UIKit"]

  # Static library configuration
  spec.static_framework = true

  # Exclude arm64 for simulator
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'CODE_SIGNING_ALLOWED' => 'NO'
  }
  spec.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end
