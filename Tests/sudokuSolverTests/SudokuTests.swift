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

    func testIsSudokuFile() throws {
        let validFile = [
            "  abc def ghi",
            "1 7__|_4_|__1",
            "2 __1|___|2__",
            "3 _6_|2_9|_8_",
            "  -----------",
            "4 __3|5_4|9__",
            "5 1__|___|__4",
            "6 __2|1_8|5__",
            "  -----------",
            "7 _1_|9_6|_7_",
            "8 __8|___|4__",
            "9 6__|_2_|__8"].joined(separator: "\n")
        let badCharacter = [
            "  abc def ghi",
            "1 7__|_4_|__1",
            "2 __1|_w_|2__",
            "3 _6_|2_9|_8_",
            "  -----------",
            "4 __3|5_4|9__",
            "5 1__|___|__4",
            "6 __2|1_8|5__",
            "  -----------",
            "7 _1_|9_6|_7_",
            "8 __8|___|4__",
            "9 6__|_2_|__8"].joined(separator: "\n")
        XCTAssertTrue(Sudoku.isSudokuFile(validFile))
        XCTAssertFalse(Sudoku.isSudokuFile(badCharacter))
    }
}