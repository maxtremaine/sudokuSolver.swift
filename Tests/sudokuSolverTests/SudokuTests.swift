import XCTest
@testable import sudokuSolver

final class SudokuTests: XCTestCase {
    func testIsSudokuString() throws {
        let validSudokuString = "7___4___1__1___2___6_2_9_8___35_49__1_______4__21_85___1_9_6_7___8___4__6___2___8"
        let badCharacter = "7a__4___1__1___2___6_2_9_8___35_49__1_______4__21_85___1_9_6_7___8___4__6___2___8"
        let long = "7___4___1__1___2___6_2_9_8___35_49__1_______4__21_85___1_9_6_7___8___4__6___2___8_"
        let short = "7___4___1__1___2___6_2_9_8___35_49__1_______4__21_85___1_9_6_7___8___4__6___2___"

        XCTAssertTrue(Sudoku.isSudokuString(validSudokuString))
        XCTAssertFalse(Sudoku.isSudokuString(badCharacter))
        XCTAssertFalse(Sudoku.isSudokuString(long))
        XCTAssertFalse(Sudoku.isSudokuString(short))
    }
}