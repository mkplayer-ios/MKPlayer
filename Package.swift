// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MKPlayer",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MKPlayer",
            targets: ["MKPlayerPackage", "MKPlayer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bitmovin/player-ios.git",
                    exact:"3.94.1")
    ],
    
    targets: [
        .target(name: "MKPlayerPackage",
                dependencies: [ 
                        .product(name: "BitmovinPlayer", package: "player-ios")
                ],
                cSettings: [
                    .define("BUILD_LIBRARY_FOR_DISTRIBUTION", to: "YES")
                ]
        ),
        .binaryTarget(name:"MKPlayer" , url: "https://mkplayer.z13.web.core.windows.net/ios_tvos/MKPlayer-1.45.0.zip", checksum: "b2743d13cdcfe144a3fa889c04a5efa9e252151441700d6d047ce57468ee2a8f")
    ]
)
