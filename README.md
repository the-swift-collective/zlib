<!-- markdownlint-configure-file {
  "MD013": {
    "code_blocks": false,
    "tables": false
  },
  "MD033": false,
  "MD041": false
} -->

<div align="center">

<h1 align="center">
    ZLib
</h1>

<p align="center">
  <i align="center">Cross platform <b>swift</b> package for the <a href="https://zlib.net"><b>zlib library</b></a>.</i>
</p>

</div>

<h4 align="center">
  <a href="https://github.com/the-swift-collective/zlib/actions/workflows/swift-ubuntu.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/the-swift-collective/zlib/swift-ubuntu.yml?style=flat-square&label=ubuntu%20&labelColor=E95420&logoColor=FFFFFF&logo=ubuntu">
  </a>
  <a href="https://github.com/the-swift-collective/zlib/actions/workflows/swift-macos.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/the-swift-collective/zlib/swift-macos.yml?style=flat-square&label=macOS&labelColor=000000&logo=apple">
  </a>
  <a href="https://github.com/the-swift-collective/zlib/actions/workflows/swift-windows.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/the-swift-collective/zlib/swift-windows.yml?style=flat-square&label=windows&labelColor=357EC7&logo=gitforwindows">
  </a>
</h4>

<div align="center">

### Usage

</div>

##### To use zlib in swift, add zlib as a package dependency in your project's Package.swift file.
```swift
dependencies: [
  .package(url: "https://github.com/the-swift-collective/zlib.git", from: "1.3.1"),
]
```


##### Then, for any target you'd like, add the zlib product as a target dependency, a complete example.
```swift
// swift-tools-version: 5.8
import PackageDescription

let package = Package(
  name: "MyPackage",
  products: [
    .library(
      name: "MyLibrary",
      targets: ["MyLibrary"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/the-swift-collective/zlib.git", from: "1.3.1")
  ],
  targets: [
    .target(
      name: "MyLibrary",
      dependencies: [
        /* add the zlib product as a library dependency. */
        .product(name: "ZLib", package: "zlib"),
      ]
    ),
  ]
)
```

<br>

<hr/>

###### ***the swift collective** - cross platform **swift packages**.*
###### zlib is licensed under the terms of the [zlib license](https://zlib.net/zlib_license.html).
