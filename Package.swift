// swift-tools-version: 5.8
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
        .package(url: "https://github.com/mkplayer-ios/OMSDK_Mediakind.git", exact: "0.0.2"),
        .package(url: "https://github.com/bitmovin/player-ios-core.git",
                    exact:"3.40.0"),
        .package(url: "https://github.com/bitmovin/bitmovin-analytics-collector-ios",
                 exact:"3.0.0-a.1")
    ],
    
    targets: [
        .target(name: "MKPlayerPackage",
                dependencies: [ "Alamofire", "MKPlayer", "asid_ott_sdk",
                                .product(name: "OMSDK_Mediakind", package: "OMSDK_Mediakind",condition: .when(platforms: [.iOS])),
                            
                    .product(name: "BitmovinPlayerCore", package: "player-ios-core"),
                    .product(name: "BitmovinCollector", package: "bitmovin-analytics-collector-ios")
                    ],
                cSettings: [
                    .define("BUILD_LIBRARY_FOR_DISTRIBUTION", to: "YES")
                ]
        ),
        .binaryTarget(name:"MKPlayer", url: "https://mkplayer.blob.core.windows.net/$web/ios_tvos_rc_build/MKPlayer-1.3.2-rc.1.zip", checksum: "53a9b7b900cde823b5aa5d16cb04d4b88c0844fe0f81fb8f995c45051c04f5db"),
        .binaryTarget(
          name: "asid_ott_sdk",
          path: "./asid_ott_sdk.xcframework"
        ),
        .binaryTarget(
          name: "Alamofire",
          path: "./Alamofire.xcframework"
        ),
    ]
)
