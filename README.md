# Nimbbl Core API SDK for iOS

A universal XCFramework for Nimbbl payment integration on iOS.

## Features

- **Universal XCFramework**: Supports both device (arm64) and simulator (arm64 + x86_64) architectures
- **iOS 13.0+**: Compatible with iOS 13.0 and later
- **Swift 5.0**: Built with Swift 5.0
- **Static Framework**: No external dependencies

## Installation

### CocoaPods

Add this line to your Podfile:

```ruby
pod 'nimbbl_mobile_kit_ios_core_api_sdk', '~> 1.3.5'
```

Then run:

```bash
pod install
```

### Manual Installation

1. Download the `nimbbl_mobile_kit_ios_core_api_sdk.xcframework`
2. Drag and drop it into your Xcode project
3. Make sure "Embed & Sign" is selected in the framework settings

## Usage

```swift
import nimbbl_mobile_kit_ios_core_api_sdk

// Initialize the SDK
let sdk = NimbblCoreApiSDK.shared

// Create checkout options
let options = NimbblCheckoutOptions()
options.orderToken = "your_order_token"
options.amount = 100.0
options.currency = "INR"
```

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, email support@nimbbl.biz
