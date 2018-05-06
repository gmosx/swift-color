import XCTest
@testable import Color

class ColorTests: XCTestCase {
    func testRGBToHSL() {
        let c = Color.purple
        print(c.rgba)
        print(c.hsla)
    }

    static var allTests = [
        ("testRGBToHSL", testRGBToHSL),
    ]
}
