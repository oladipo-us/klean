import XCTest
@testable import Klean

final class KleanTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Klean().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
