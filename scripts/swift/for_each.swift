func doubleForIn(_ numbers: [Int]) {
    print("\nA for...in style loop:")
    var array: [Int] = []
    for number in numbers {
        array.append(number * 2)
    }
    print("Doubles: \(array)")
}

func doubleForEach(_ numbers: [Int]) {
    print("\nFunctional style forEach()")
    var array: [Int] = []
    numbers.forEach() { number in
        array.append(number * 2)
    }
    print("Doubles: \(array)")
}

//
// ----- Start of Script -----
//

let numbers = [1, 2, 3, 4, 5]
print("Numbers: \(numbers)")

doubleForIn(numbers)
doubleForEach(numbers)
