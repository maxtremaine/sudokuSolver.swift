import XCTest
@testable import sudokuSolver

final class pureFunctionTests: XCTestCase {
    func testGetMissingDigits() throws {
        XCTAssertEqual([ 1, 2, 3 ].getMissingDigits(), [ 4, 5, 6, 7, 8, 9 ])
        XCTAssertEqual([ 1, 2, 10 ].getMissingDigits(), [])
    }

    func testHasDuplicates() throws {
        let arrayWithDuplicates = [ 1, 2, 3, 3 ]
        let arrayWithoutDuplicates = [ 1, 2, 3 ]
    
        XCTAssertTrue(arrayWithDuplicates.hasDuplicates())
        XCTAssertFalse(arrayWithoutDuplicates.hasDuplicates())
    }
}