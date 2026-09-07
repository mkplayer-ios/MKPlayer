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
                    exact:"3.111.1")
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
        .binaryTarget(name:"MKPlayer" , url: "https://mkplayer.z13.web.core.windows.net/ios_tvos/MKPlayer-1.68.0-QA.zip", checksum: "94f68077ac36c9eb0d9b3f02b2fa046e99ed462a0db24035d0ffc7503564c33e")
    ]
)
