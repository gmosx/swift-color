import XCTest
@testable import Color

class ColorTests: XCTestCase {
    func testRGBToHSL() {
        let c = Color.purple
        print(c.rgba)
        print(c.hsla)
        print(c.luma)
    }

    static var allTests = [
        ("testRGBToHSL", testRGBToHSL),
    ]
}
