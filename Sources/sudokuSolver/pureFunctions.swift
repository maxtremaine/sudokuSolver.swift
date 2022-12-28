extension Array where Element == Int {
    func hasDuplicates() -> Bool {
        for (i, value) in self.enumerated() {
            if ( self.lastIndex(of: value) != i ) {
                return true
            }
        }
        
        return false
    }
}