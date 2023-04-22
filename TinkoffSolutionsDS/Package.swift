// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TinkoffSolutionsDSPackage",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "TinkoffSolutionsDS",
            targets: ["TinkoffSolutionsDS"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TinkoffSolutionsDS",
            dependencies: [],
            path: "Sources",
            resources: [.process("Resources")]),
    ]
)
