import Foundation

let sudokuFile = try String(contentsOfFile: "./IO/start.sudoku")

let t0 = Date()

assert(Sudoku.isSudokuFile(sudokuFile), "Sudoku file is not valid.")

let startPuzzle = Sudoku.fromSudokuFile(sudokuFile)

assert(startPuzzle.isValid(), "Values in io/start.sudoku do not form a valid Sudoku puzzle.")

let numberOfRuns = startPuzzle.cells.filter { $0 == 0 }.count

let endPuzzles: [Sudoku] = Array(1...numberOfRuns).reduce(into: [ startPuzzle ]) {
    workingBranches, runNumber in

    let newWorkingBranches: [Sudoku] = workingBranches.reduce(into: []) {
        newBranches, oldBranch in

        let blankCells = oldBranch.getBlankCells()
            .sorted { $0.possibleValues.count < $1.possibleValues.count }
        
        for possibleValue in blankCells[0].possibleValues {
            newBranches.append(Sudoku(oldBranch.cells.replace(blankCells[0].index, newValue: possibleValue)))
        }
    }

    print("Completed run \(runNumber) with \(newWorkingBranches.count) branches.")

    workingBranches = newWorkingBranches
}

print(endPuzzles[0].toSudokuFile())

print("Ran in \(Date().timeIntervalSince(t0)) seconds.")