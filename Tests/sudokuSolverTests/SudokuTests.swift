import XCTest
@testable import sudokuSolver

final class SudokuTests: XCTestCase {
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
            "9 6__|_2_|__8"
        ].joined(separator: "\n")
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
            "9 6__|_2_|__8"
        ].joined(separator: "\n")
        
        XCTAssertTrue(Sudoku.isSudokuFile(validFile))
        XCTAssertFalse(Sudoku.isSudokuFile(badCharacter))
    }

    func testIsValidSudoku() throws {
        let valid_puzzle = [ 7, 0, 0, 0, 4, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 6, 0, 2, 0, 9,
            0, 8, 0, 0, 0, 3, 5, 0, 4, 9, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 2, 1, 0, 8, 5,
            0, 0, 0, 1, 0, 9, 0, 6, 0, 7, 0, 0, 0, 8, 0, 0, 0, 4, 0, 0, 6, 0, 0, 0, 2, 0, 0, 0, 8 ]
        let invalid_puzzle = [7, 7, 0, 0, 4, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 6, 0, 2, 0, 9,
            0, 8, 0, 0, 0, 3, 5, 0, 4, 9, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 2, 1, 0, 8, 5, 0,
            0, 0, 1, 0, 9, 0, 6, 0, 7, 0, 0, 0, 8, 0, 0, 0, 4, 0, 0, 6, 0, 0, 0, 2, 0, 0, 0, 8 ]
        
        XCTAssertTrue(Sudoku(valid_puzzle).isValid())
        XCTAssertFalse(Sudoku(invalid_puzzle).isValid())
    }

    func testFromSudokuFile() throws {
        let sudokuFile = [
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
            "9 6__|_2_|__8"
        ].joined(separator: "\n")
        let sudokuValues = [ 7, 0, 0, 0, 4, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 6, 0, 2, 0,
            9, 0, 8, 0, 0, 0, 3, 5, 0, 4, 9, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 2, 1, 0, 8,
            5, 0, 0, 0, 1, 0, 9, 0, 6, 0, 7, 0, 0, 0, 8, 0, 0, 0, 4, 0, 0, 6, 0, 0, 0, 2, 0, 0,
            0, 8]

        XCTAssertEqual(Sudoku.fromSudokuFile(sudokuFile).cells, sudokuValues)
    }

    func testGetRelatedCells() throws {
        let sudokuFile = [
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
            "9 6__|_2_|__8"
        ].joined(separator: "\n")
        let relatedToOne = [ 1, 4, 6, 7 ]

        XCTAssertEqual(
            Sudoku.fromSudokuFile(sudokuFile).getRelatedCellValues(index: 1),
            relatedToOne
        )
    }

    func testGetBlankCells() throws {
        let testPuzzle = [
            "  abc def ghi",
            "1 _12|954|836",
            "2 539|186|247",
            "3 684|237|519",
            "  -----------",
            "4 325|479|681",
            "5 198|365|724",
            "6 476|821|953",
            "  -----------",
            "7 247|593|168",
            "8 861|742|395",
            "9 953|618|472",
        ].joined(separator: "\n")

        XCTAssertEqual(
            Sudoku.fromSudokuFile(testPuzzle).getBlankCells(),
            [ BlankCell(index: 0, possibleValues: [ 7 ]) ]
        )
    }

    func testToSudokuFile() throws {
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
            "9 6__|_2_|__8"
        ].joined(separator: "\n")

        let validSuodku = Sudoku([ 7, 0, 0, 0, 4, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, 0, 0,
            0, 6, 0, 2, 0, 9, 0, 8, 0, 0, 0, 3, 5, 0, 4, 9, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0,
            0, 2, 1, 0, 8, 5, 0, 0, 0, 1, 0, 9, 0, 6, 0, 7, 0, 0, 0, 8, 0, 0, 0, 4, 0, 0, 6, 0,
            0, 0, 2, 0, 0, 0, 8 ])

        XCTAssertEqual(validSuodku.toSudokuFile(), validFile)
    }
}