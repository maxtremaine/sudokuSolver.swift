public struct Sudoku {
    let values: [Int]
    
    // If a string is 81 digits or underscores, return true.
    public static func isSudokuString(_ sudokuString: String) -> Bool {
        if (sudokuString.count != 81) { return false }

        for character in sudokuString {
            if (!sudokuStringValues.contains(String(character))) {
                return false
            }
        }
        
        return true
    }

    public static func isSudokuFile(_ sudokuFile: String) -> Bool {
        if (sudokuFile.count != 167) { return false }

        for character in sudokuFile {
            if (!sudokuFileValues.contains(String(character))) {
                return false
            }
        }

        return true
    }
}

private let sudokuStringValues = [ "_", "1", "2", "3", "4", "5", "6", "7", "8", "9" ]

private let sudokuFileValues = [ " ", "\n", "|", "_", "-", "a", "b", "c", "d", "e", "f", "g",
    "h", "i"] + sudokuStringValues



private let fileToStringConversionIndexes = [ 16, 17, 18, 20, 21, 22, 24, 25, 26, 30, 31, 32, 34,
    35, 36, 38, 39, 40, 44, 45, 46, 48, 49, 50, 52, 53, 54, 72, 73, 74, 76, 77, 78, 80, 81, 82,
    86, 87, 88, 90, 91, 92, 94, 95, 96, 100, 101, 102, 104, 105, 106, 109, 110, 128, 129, 130,
    132, 133, 134, 136, 137, 138, 142, 143, 144, 146, 147, 148, 150, 151, 152, 156, 157, 158,
    160, 161, 162, 164, 165, 166 ]