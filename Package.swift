// swift-tools-version: 5.5
//
// SPDX-License-Identifier: Zlib
// Copyright Contributors to the Zlib project

import Foundation
import PackageDescription

// static unless SWIFT_COLLECTIVE_DYNAMIC_LIBRARIES=1, which a host linking this into several
// dynamic frameworks sets so they share one copy instead of each carrying its own
// windows stays static since a dynamic C library there exports nothing
#if os(Windows)
  let sharedLinkage: Product.Library.LibraryType? = nil
#else
  let sharedLinkage: Product.Library.LibraryType? =
    ProcessInfo.processInfo.environment["SWIFT_COLLECTIVE_DYNAMIC_LIBRARIES"] == "1" ? .dynamic : nil
#endif

let package = Package(
  name: "zlib",
  products: [
    .library(
      name: "ZLibC",
      targets: ["ZLibC"]
    ),
    .library(
      name: "ZLib",
      type: sharedLinkage,
      targets: ["ZLib"]
    ),
  ],
  targets: [
    .target(
      name: "ZLibC",
      path: "zlib",
      exclude: [
        "amiga",
        "contrib",
        "doc",
        "examples",
        "msdos",
        "nintendods",
        "old",
        "os400",
        "qnx",
        "test",
        "watcom",
        "win32",
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("."),
        .define("HAVE_ATTRIBUTE_ALIGNED", to: "1"),
        .define("WITH_GZFILEOP", to: "1"),
        .define("HAVE_UNISTD_H", to: "1", .when(platforms: [.macOS, .iOS, .visionOS, .tvOS, .watchOS, .linux, .android, .macCatalyst])),
        .define("Z_HAVE_STDARG_H", to: "1"),
      ],
      cxxSettings: [
        .define("_ALLOW_COMPILER_AND_STL_VERSION_MISMATCH", .when(platforms: [.windows])),
      ]
    ),

    .target(
      name: "ZLib",
      dependencies: [
        .target(name: "ZLibC")
      ]
    ),

    .testTarget(
      name: "ZLibTests",
      dependencies: [
        .target(name: "ZLib")
      ]
    ),
  ]
)
