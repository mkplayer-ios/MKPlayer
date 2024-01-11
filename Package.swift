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
                    exact:"3.53.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0")
    ],
    
    targets: [
        .target(name: "MKPlayerPackage",
                dependencies: [ .product(name: "BitmovinPlayer", package: "player-ios"),
                                .product(name: "Alamofire", package: "Alamofire")
                    ],
                cSettings: [
                    .define("BUILD_LIBRARY_FOR_DISTRIBUTION", to: "YES")
                ]
        ),
        .binaryTarget(name:"MKPlayer" , url: "https://mkplayer.z13.web.core.windows.net/ios_tvos/MKPlayer-1.14.0.zip", checksum: "64f51e625f4fd5a3270e6647eb63304026e3d168b55e0a2db81b313c4af7fde1")
    ]
)
