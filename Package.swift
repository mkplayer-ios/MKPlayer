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
                    exact:"3.97.1")
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
        .binaryTarget(name:"MKPlayer" , url: "https://mkplayer.z13.web.core.windows.net/ios_tvos/MKPlayer-1.48.0-rc.zip", checksum: "09596318b93b0f3f36102abd25a3e4b3e6d4b0fab7636a71117bbd707ab04c77")
    ]
)
