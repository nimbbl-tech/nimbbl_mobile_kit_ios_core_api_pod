// swift-tools-version:5.9
import PackageDescription

// Nimbbl Core API SDK — Swift Package Manager (BINARY distribution).
//
// This public "pod" repo ships the SDK as a prebuilt, closed-source XCFramework
// (the same artifact used for CocoaPods). No source is exposed.
//
// The module name matches the CocoaPods module, so the import is identical
// regardless of integration method:
//
//     import nimbbl_mobile_kit_ios_core_api_sdk
//
// Release: rebuild nimbbl_mobile_kit_ios_core_api_sdk.xcframework from the
// (private) source repo, commit it here, bump version.properties, and tag.
let package = Package(
    name: "nimbbl_mobile_kit_ios_core_api_sdk",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "nimbbl_mobile_kit_ios_core_api_sdk",
            targets: ["nimbbl_mobile_kit_ios_core_api_sdk"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "nimbbl_mobile_kit_ios_core_api_sdk",
            path: "nimbbl_mobile_kit_ios_core_api_sdk.xcframework"
        )
    ]
)
