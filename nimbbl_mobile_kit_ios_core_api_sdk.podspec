Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.0.7"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS."
  spec.homepage     = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_sdk"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tech@nimbbl.biz" }
  
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => spec.version }

  # Use framework to provide Swift module support
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.framework"
  
  # Framework search paths
  spec.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/nimbbl_mobile_kit_ios_core_api_sdk',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  spec.swift_version = "5.0"
  spec.framework    = "Foundation"
  spec.framework    = "UIKit"
end
