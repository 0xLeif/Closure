// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Closure",
  products: [
    .library(
      name: "Closure",
      targets: ["Closure"]
    ),
  ],
  targets: [
    .target(
      name: "Closure",
      dependencies: []
    ),
    .testTarget(
      name: "ClosureTests",
      dependencies: ["Closure"]
    ),
  ]
)
