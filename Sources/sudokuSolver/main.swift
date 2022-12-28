import Foundation

let sudokuFile = try String(contentsOfFile: "./IO/start.sudoku")

let t0 = Date()

print("Ran in \(Date().timeIntervalSince(t0)) seconds.")