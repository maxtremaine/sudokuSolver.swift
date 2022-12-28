import XCTest
@testable import sudokuSolver

final class pureFunctionTests: XCTestCase {
    func testHasDuplicates() throws {
        let arrayWithDuplicates = [ 1, 2, 3, 3 ]
        let arrayWithoutDuplicates = [ 1, 2, 3 ]
    
        XCTAssertTrue(arrayWithDuplicates.hasDuplicates())
        XCTAssertFalse(arrayWithoutDuplicates.hasDuplicates())
    }
}