Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.5.9"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS"
  spec.homepage     = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod"
  spec.license      = { :type => 'MIT' }
  spec.author       = { "Nimbbl" => "support@nimbbl.com" }
  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.xcframework"
  spec.frameworks = ["Foundation", "UIKit"]
  spec.static_framework = true
  spec.pod_target_xcconfig = { 'CODE_SIGNING_ALLOWED' => 'NO' }
end
