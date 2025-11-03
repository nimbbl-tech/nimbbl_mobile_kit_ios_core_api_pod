Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_core_api_sdk"
  
  # Read version from version.properties file
  version_file = File.join(File.dirname(__FILE__), 'version.properties')
  if File.exist?(version_file)
    version_content = File.read(version_file)
    version_match = version_content.match(/^SDK_VERSION=(.+)$/)
    spec.version = version_match ? version_match[1].strip : "2.0.3-SNAPSHOT-20250926131439"
  else
    spec.version = "2.0.3-SNAPSHOT-20250926131439"
  end
  spec.summary      = "Nimbbl Core API SDK for iOS"
  spec.description  = "Core API SDK for Nimbbl payment integration on iOS"
  spec.homepage     = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod"
  spec.license      = { :type => 'MIT' }
  spec.author       = { "Nimbbl" => "support@nimbbl.com" }
  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.0"
  # For local development (uncomment for local development)
  # spec.source       = { :path => "." }
  # spec.source_files = "nimbbl_mobile_kit_ios_core_api_sdk/*.swift"
  
  # For production release
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_core_api_sdk.xcframework"
  
  spec.frameworks = ["Foundation", "UIKit"]
  # Always use dynamic framework when building from source files (use_frameworks! requires dynamic)
  # When vendored_frameworks is used (production), static_framework can be set to true if needed
  spec.static_framework = false  # Dynamic framework required for use_frameworks!
  spec.pod_target_xcconfig = { 'CODE_SIGNING_ALLOWED' => 'NO' }
end
