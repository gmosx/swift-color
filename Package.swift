// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Color",
    products: [
        .library(
            name: "Color",
            targets: ["Color"]
        ),
        .library(
            name: "NamedColors",
            targets: ["NamedColors"]
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
            dependencies: ["Color", "NamedColors"]
        ),
        .target(
            name: "NamedColors",
            dependencies: ["Color"]
        ),
    ]
)
