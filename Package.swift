// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Klean",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "KleanFoundation",
            targets: [
                "KleanFoundation",
            ]),
        .library(
            name: "KleanLogic",
            targets: [
                "KleanLogic",
            ]),
        .library(
            name: "KleanLogicServices",
            targets: [
                "KleanLogicServices",
            ]),
        .library(
            name: "KleanUI",
            targets: [
                "KleanUI",
            ]),
        .library(
            name: "KleanUIModels",
            targets: [
                "KleanUIModels",
            ]),
        .library(
            name: "KleanUIPresenters",
            targets: [
                "KleanUIPresenters",
            ]),
        .library(
            name: "Klean",
            targets: [
                "KleanFoundation",
                "KleanLogic",
                "KleanLogicServices",
                "KleanUI",
                "KleanUIModels",
                "KleanUIPresenters",
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "KleanFoundation",
            dependencies: []),
        .target(
            name: "KleanLogic",
            dependencies: [
                "KleanFoundation",
            ]),
        .target(
            name: "KleanLogicServices",
            dependencies: [
                "KleanFoundation",
            ]),
        .target(
            name: "KleanUIPresenters",
            dependencies: [
                "KleanFoundation",
                "KleanUIModels",
            ]),
        .target(
            name: "KleanUIModels",
            dependencies: [
                "KleanFoundation",
            ]),
        .target(
            name: "KleanUI",
            dependencies: [
                "KleanFoundation",
                "KleanUIModels",
            ]),
        .testTarget(
            name: "KleanTests",
            dependencies: ["KleanFoundation", "KleanLogic", "KleanLogicServices"]),
    ]
)
