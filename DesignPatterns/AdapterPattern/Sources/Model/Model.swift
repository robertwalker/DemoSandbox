import Foundation

protocol RoundHoleInsertable {
    var diameter: Double { get }
}

struct RounHole {
    let diameter: Double
    
    func fits(peg: RoundHoleInsertable) -> Bool {
        return diameter >= peg.diameter
    }
}

struct RoundPeg: RoundHoleInsertable {
    let diameter: Double
}

struct SquarePeg {
    let sideLength: Double
}

struct SquarePegAdapter: RoundHoleInsertable {
    let peg: SquarePeg
    var diameter: Double {
        // Transform the square peg to a size that will fitk within a round hole
        peg.sideLength * sqrt(2.0) / 2.0
    }
}
