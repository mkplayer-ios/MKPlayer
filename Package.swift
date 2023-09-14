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
            targets: ["MKPlayerPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bitmovin/player-ios.git",
                    exact:"3.41.2"),
        .package(url: "https://github.com/bitmovin/bitmovin-analytics-collector-ios",
                 exact:"3.1.1")
    ],
    
    targets: [
        .target(name: "MKPlayerPackage",
                dependencies: [ "MKPlayer", "Alamofire",
                    .product(name: "BitmovinPlayer", package: "player-ios"),
                    .product(name: "BitmovinCollector", package: "bitmovin-analytics-collector-ios")
                    ],
                cSettings: [
                    .define("BUILD_LIBRARY_FOR_DISTRIBUTION", to: "YES"),
                    .define("EXCLUDED_ARCHS[sdk=iphonesimulator*]", to: "arm64"),
                    .define("EXCLUDED_ARCHS[sdk=appletvsimulator*]", to: "arm64", .when(platforms: [.tvOS]))
                ]
        ),
        .binaryTarget(name:"MKPlayer" , url: "https://mkplayer.blob.core.windows.net/$web/ios_tvos/MKPlayer-1.7.0-a1.zip", checksum: "a21935ad10baa6e65a6e201bb43b6ba51dd2fc6815047001a46f1287dde57a88"),
        .binaryTarget(
            name: "Alamofire",
            path: "./Alamofire.xcframework"
          ),
    ]
)
