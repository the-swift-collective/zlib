// SPDX-License-Identifier: Zlib
// Copyright Contributors to the Zlib project

@testable import ZLib
import XCTest

class ZLibTests: XCTestCase
{
  func testZLibVersion() throws
  {
    print("zlib version: \(String(cString: zlibVersion()))")
  }
}
