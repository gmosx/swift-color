// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Color",
    products: [
        .library(
            name: "Color",
            targets: ["Color"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Color",
            dependencies: []
        ),
        .testTarget(
            name: "ColorTests",
            dependencies: ["Color"]
        ),
    ]
)
