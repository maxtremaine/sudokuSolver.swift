struct BlankCell: Equatable {
    let index: Int
    let possibleValues: [Int]

    static func ==(lhs: BlankCell, rhs: BlankCell) -> Bool {
        return lhs.index == rhs.index && lhs.possibleValues == rhs.possibleValues
    }
}