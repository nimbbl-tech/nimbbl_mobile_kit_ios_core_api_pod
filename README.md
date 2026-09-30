# Nimbbl Core API SDK for iOS

A prebuilt XCFramework providing the core layer (order management, API calls,
UPI detection, event logging) for the Nimbbl iOS SDKs. Distributed via
**Swift Package Manager** and **CocoaPods**.

> Most integrators do **not** add this directly — it is pulled in automatically
> as a dependency of the [WebView SDK](https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod).
> Add it on its own only if you are building a custom checkout on the Core API.

## Features

- **Binary XCFramework**: device (arm64) + simulator (arm64 + x86_64)
- **iOS 15.0+**
- **Swift 5.0+**, built against the iOS 27 SDK
- No external dependencies

## Installation

### Swift Package Manager

```
https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git
```

Or in `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git",
        exact: "2.1.0-alpha.1"
    )
]
```

### CocoaPods (legacy — 2.0.x only)

> **2.1.0 and later are distributed via Swift Package Manager only.** CocoaPods
> continues to serve existing **2.0.x** releases. CocoaPods Trunk goes read-only
> on **2 Dec 2026**.

```ruby
pod 'nimbbl_mobile_kit_ios_core_api_sdk', '~> 2.0.17'
```

## Usage

```swift
import nimbbl_mobile_kit_ios_core_api_sdk

let options = NimbblCheckoutOptions(
    orderToken: "your_order_token",
    paymentModeCode: nil,
    bankCode: nil,
    walletCode: nil,
    paymentFlow: nil
)
```

## Requirements

- iOS 15.0+
- Xcode 15.0+ (built against the iOS 27 SDK)
- Swift 5.0+

## License

Licensed under the MIT License — see [LICENSE](LICENSE).

## Support

For support, email support@nimbbl.biz
