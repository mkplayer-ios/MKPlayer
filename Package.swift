// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MKPlayer",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MKPlayer",
            targets: ["MKPlayerPackage", "MKPlayer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bitmovin/player-ios.git",
                    exact:"3.47.0"),
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
        .binaryTarget(name:"MKPlayer" , url: "https://mkplayer.z13.web.core.windows.net/ios_tvos/MKPlayer-1.11.0.zip", checksum: "d2e411a2fa2b468e8a5fcb12e3ba40b602cb37e2da2571cab185802655f6ddb6")
    ]
)
