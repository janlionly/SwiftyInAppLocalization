import XCTest
@testable import InAppLocalization

final class InAppLocalizationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(InAppLocalization().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
