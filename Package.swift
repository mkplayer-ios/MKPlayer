// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MKPlayer",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AdvancedFramework", targets: ["AdvancedFrameworkPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bitmovin/player-ios-core.git",
                    exact:"3.40.0"),
        .package(url: "https://github.com/bitmovin/player-ios.git",
                    exact:"3.40.0"),

        .package(url: "https://github.com/bitmovin/bitmovin-analytics-collector-ios",
                 exact:"3.0.0-a.1")
    ],
    
    targets: [
        .target(name: "AdvancedFrameworkPackage",
                dependencies: [ "AdvancedFramework", "GoogleCast",
                    .product(name: "BitmovinPlayerCore", package: "player-ios-core"),
                    .product(name: "BitmovinPlayer", package: "player-ios"),
                    .product(name: "BitmovinCollector", package: "bitmovin-analytics-collector-ios")
                    ],
                cSettings: [
                    .define("BUILD_LIBRARY_FOR_DISTRIBUTION", to: "YES")
                ]
        ),
        .binaryTarget(name:"AdvancedFramework", url: "https://mkplayer.blob.core.windows.net/$web/ios_tvos_rc_build/AdvancedFramework-1.zip", checksum: "9c50fde9517f904bd72fc825772f045c214e81aad02f6e0c8d76a599b8f3711c"),
        .binaryTarget(name: "GoogleCast", path: "./GoogleCast.xcframework")
    ]
)
