// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitXcodePreview",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "UIKitXcodePreview",
            targets: ["UIKitXcodePreview"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIKitXcodePreview",
            dependencies: [])
    ]
)
