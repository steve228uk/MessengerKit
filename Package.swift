// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MessengerKit",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "MessengerKit",
            targets: ["MessengerKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MessengerKit",
            dependencies: [],
            path: "MessengerKit"
        ),
    ]
)
