extension Array where Element == Int {
    func getMissingDigits() -> [Int] {
        if( !self.allSatisfy { Array(1...9).contains($0) } ) {
            return []
        }

        return Array(1...9).filter{ !self.contains($0) }        
    }

    func hasDuplicates() -> Bool {
        for (i, value) in self.enumerated() {
            if ( self.lastIndex(of: value) != i ) {
                return true
            }
        }
        
        return false
    }

    func replace(_ i: Int, newValue: Int) -> [Int] {
        var newArray = self

        newArray[i] = newValue
        
        return newArray
    }
}