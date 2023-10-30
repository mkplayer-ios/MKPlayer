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
                    exact:"3.42.0"),
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
        .binaryTarget(name:"MKPlayer" , url: "https://mkplayer.z13.web.core.windows.net/ios_tvos/MKPlayer-1.10.0-rc.zip", checksum: "ff0172b6655fd12c54f967240fa14183d5a1e7a73de24b5817fd91d9797a1264")
    ]
)
