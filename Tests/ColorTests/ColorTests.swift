import XCTest
@testable import Color
import NamedColors

class ColorTests: XCTestCase {
    func testRGBToHSL() {
        let c = NamedColors.purple
        
        let hsl = c.hsl
        
        XCTAssertEqual(hsl.hue, 300)
        XCTAssertEqual(hsl.saturation, 1.0)
        XCTAssertEqual(hsl.lightness, 0.25)
    }

    func testHSLToRGB() {
        let color = Color(hue: 300, saturation: 1, lightness: 0.25)
        let purple = NamedColors.purple

        XCTAssertEqual(color.red, purple.red, accuracy: 0.01)
        XCTAssertEqual(color.green, purple.green, accuracy: 0.01)
        XCTAssertEqual(color.blue, purple.blue, accuracy: 0.01)
    }

    func testAdjustments() {
        let purple = NamedColors.purple
        let lighterPurple = purple.lighter(by: 0.1)
        let darkerPurple = purple.darker(by: 0.1)

        print("****", purple, lighterPurple, darkerPurple)
    }

    static var allTests = [
        ("testRGBToHSL", testRGBToHSL),
    ]
}
