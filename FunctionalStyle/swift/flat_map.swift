func doubleFlatMap(_ numbers: [[Int]]) {
    print("\nFunctional style flat map transformation:")
    let array = numbers.flatMap() { $0 }.map() { $0 * 2 }
    print("Doubles flattened: \(array)")
}

//
// ----- Start of Script -----
//

let numbers = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]
print("Number groups: \(numbers)")

doubleFlatMap(numbers)
