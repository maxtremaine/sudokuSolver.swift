import XCTest
@testable import sudokuSolver

final class ArrayTests: XCTestCase {
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

    func testReplace() throws {
        let originalArray = [ 1, 2, 3 ]

        let newArray = originalArray.replace(1, newValue: 3)

        XCTAssertEqual(originalArray, [ 1, 2, 3 ]) // Original Array is unchanged.
        XCTAssertEqual(newArray, [ 1, 3, 3 ])
    }

    func testUnique() throws {
        XCTAssertEqual([ 1, 3, 3, 2 ].unique(), [ 1, 2, 3 ])
    }
}