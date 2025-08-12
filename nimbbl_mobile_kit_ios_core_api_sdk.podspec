Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  spec.version      = "1.0.4"
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS. This SDK provides the core API functionality for payment processing, order management, and transaction handling."
  spec.homepage     = "https://nimbbl.biz"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tools@nimbbl.biz" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => "#{spec.version}" }
  
  # Framework distribution - no source code
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.framework"
  
  spec.swift_version = "5.0"
  spec.framework    = "Foundation"
  spec.framework    = "UIKit"
end
