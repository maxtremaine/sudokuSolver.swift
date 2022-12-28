import Foundation

let sudokuFile = try String(contentsOfFile: "./IO/start.sudoku")

let t0 = Date()

assert(Sudoku.isSudokuFile(sudokuFile), "Sudoku file is not valid.")

let startPuzzle = Sudoku.fromSudokuFile(sudokuFile)

print("Ran in \(Date().timeIntervalSince(t0)) seconds.")