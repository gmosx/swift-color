import XCTest
@testable import Color

class ColorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Color().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
