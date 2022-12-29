import Foundation

let sudokuFile = try String(contentsOfFile: "./IO/start.sudoku")

let t0 = Date()

assert(Sudoku.isSudokuFile(sudokuFile), "Sudoku file is not valid.")

let startPuzzle = Sudoku.fromSudokuFile(sudokuFile)

assert(startPuzzle.isValid(), "Values in io/start.sudoku do not form a valid Sudoku puzzle.")

let numberOfRuns = startPuzzle.cells.filter { $0 == 0 }.count

// Iterate through the number of blank cells, adding possible values until branches collapse.
let endPuzzles: [Sudoku] = Array(1...numberOfRuns).reduce(into: [ startPuzzle ]) {
    workingBranches, runNumber in

    let newWorkingBranches: [Sudoku] = workingBranches.reduce(into: []) {
        newBranches, oldBranch in

        // Sort the blank cells by degrees of freedom (possibleValues).
        let blankCells = oldBranch.getBlankCells()
            .sorted { $0.possibleValues.count < $1.possibleValues.count }
        
        for possibleValue in blankCells[0].possibleValues {
            // Add a new branch with a possible value in place of the blank cell.
            newBranches.append(Sudoku(oldBranch.cells.replace(blankCells[0].index, newValue: possibleValue)))
        }
    }

    print("Completed run \(runNumber) with \(newWorkingBranches.count) branches.")

    workingBranches = newWorkingBranches
}

let endPuzzleData = endPuzzles[0].toSudokuFile().data(using: .utf8)!

try endPuzzleData.write(to: URL(fileURLWithPath: "./IO/finish.sudoku"))

print("Ran in \(Date().timeIntervalSince(t0)) seconds.")