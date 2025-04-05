func compactMapStringToInt(_ possibleNumbers: [String]) {
    print("\nFunctional style compact map transformation:")
    let mapped: [Int?] = possibleNumbers.map() { Int($0) }
    print("Mapped: \(mapped)")
    let compactMapped = mapped.compactMap() { $0 }
    print("Compact mapped: \(compactMapped)")
}

//
// ----- Start of Script -----
//

let possibleNumbers = ["1", "2", "three", "///4///", "5"]
print("Possible Numbers: \(possibleNumbers)")

compactMapStringToInt(possibleNumbers)
