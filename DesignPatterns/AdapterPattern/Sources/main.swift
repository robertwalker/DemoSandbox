// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

print("Adapter Pattern Demo")
print("=======================")

class MainApplication {
    func run() {
        // Round peg with diameter of 5 fits in round hole of 5
        let hole = RounHole(diameter: 5)
        let roundPeg = RoundPeg(diameter: 5)
        log(hole: hole, peg: roundPeg)

        // Square pegs
        let smallSquarePeg = SquarePeg(sideLength: 5)
        let largeSquarePeg = SquarePeg(sideLength: 10)

        // Square pegs don't fit into round holes (does not compile)
        // log(hole: hole, peg: smallSquarePeg)

        // Adapt square pegs to try to fit into round holes
        let smallPegAdapter = SquarePegAdapter(peg: smallSquarePeg)
        let largePegAdapter = SquarePegAdapter(peg: largeSquarePeg)
        log(hole: hole, peg: smallPegAdapter)
        log(hole: hole, peg: largePegAdapter)
        
        print("=======================")
    }
    
    func log(hole: RounHole, peg: RoundHoleInsertable) {
        let pegType = peg is SquarePegAdapter ? "square" : "round"
        let holeDiameter = String(format: "%.2f", hole.diameter)
        let pegDiameter = String(format: "%.2f", peg.diameter)
        let itFits = hole.fits(peg: peg)
        print("A \(pegType) peg of \(pegDiameter) fits within a round hole of \(holeDiameter): \(itFits)")
    }
}

// Initialize the application and run
let app = MainApplication()
app.run()
