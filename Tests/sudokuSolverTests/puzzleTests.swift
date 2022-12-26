import XCTest
@testable import sudokuSolver

final class PuzzleTests: XCTestCase {
    func testInit() throws {
        XCTAssertEqual(Puzzle(values: [1, 2, 3]).values, [1, 2, 3])
    }
}