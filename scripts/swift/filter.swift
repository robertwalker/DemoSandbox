func oddNumbers(_ numbers: [Int]) {
    print("\nFunctional style filter numbers:")
    let array = numbers.filter() { $0 % 2 > 0 }
    print("Odd numbers: \(array)")
}

func namesStartingWithJ(_ names: [String]) {
    print("\nFunctional style filter strings:")
    let array = names.filter() { $0.starts(with: "J") }
    print(#"Names starting with "J": \#(array)"#)
}

//
// ----- Start of Script -----
//

let numbers = [1, 2, 3, 4, 5]
let names = ["Jack Reacher", "Ethan Hunt", "John Wick", "John Patrick Ryan"]
print("Numbers: \(numbers)")
print("Names: \(names)")

oddNumbers(numbers)
namesStartingWithJ(names)
