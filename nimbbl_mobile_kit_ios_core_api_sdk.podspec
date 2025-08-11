Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.0.1"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS. This SDK provides the core API functionality for payment processing, order management, and transaction handling."
  spec.homepage     = "https://nimbbl.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tools@nimbbl.biz" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => "#{spec.version}" }
  
  # Framework distribution - no source code
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.framework"
  
  spec.swift_version = "5.0"
  spec.framework    = "Foundation"
  spec.framework    = "UIKit"
  
  # Static library configuration
  spec.static_framework = true
  
  # Add code signing configuration
  spec.pod_target_xcconfig = {
    "CODE_SIGNING_ALLOWED" => "NO",
    "CODE_SIGNING_REQUIRED" => "NO",
    "CODE_SIGNING_IDENTITY" => "",
    "EXPANDED_CODE_SIGN_IDENTITY" => "",
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES",
    "SKIP_INSTALL" => "NO",
    "ENABLE_BITCODE" => "NO",
    "COPY_PHASE_STRIP" => "NO",
    "STRIP_INSTALLED_PRODUCT" => "NO",
    "STRIP_STYLE" => "non-global",
    "MACH_O_TYPE" => "staticlib",
    "DEFINES_MODULE" => "YES"
  }
  
  # Add user target xcconfig for additional compatibility
  spec.user_target_xcconfig = {
    "GENERATE_INFOPLIST_FILE" => "YES"
  }
end
