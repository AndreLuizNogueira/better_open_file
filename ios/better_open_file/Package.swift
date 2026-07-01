// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "better_open_file",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "better-open-file", targets: ["better_open_file"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "better_open_file",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            cSettings: [
                .headerSearchPath("include/better_open_file")
            ]
        )
    ]
)
