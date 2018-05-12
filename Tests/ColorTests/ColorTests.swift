import XCTest
@testable import Color

class ColorTests: XCTestCase {
    func testRGBToHSL() {
        let c = Color.purple
        
        let hsl = c.hsl
        
        XCTAssertEqual(hsl.hue, 300)
        XCTAssertEqual(hsl.saturation, 1.0)
        XCTAssertEqual(hsl.lightness, 0.25)

        let hsla = c.with(alpha: 0.5).hsla
        
        XCTAssertEqual(hsla.hue, 300)
        XCTAssertEqual(hsla.saturation, 1.0)
        XCTAssertEqual(hsla.lightness, 0.25)
        XCTAssertEqual(hsla.alpha, 0.5)
    }

    static var allTests = [
        ("testRGBToHSL", testRGBToHSL),
    ]
}
