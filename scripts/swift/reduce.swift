func doubleMapReduce(_ numbers: [Int]) {
    print("\nFunctional style map/reduce:")
    let array = numbers.map() { number in
        number * 2
    }
    print("Doubles: \(array)")
    let sum = array.reduce(0, { x, y in
        x + y
    })
    print("Sum of doubles: \(sum)")
}

func doubleMapReduceChain(_ numbers: [Int]) {
    print("\nFunctional style map/reduce chaining:")
    let sum = numbers.map() { number in
        number * 2
    }.reduce(0, { x, y in
        x + y
    })
    print("Sum of doubles: \(sum)")
}

//
// ----- Start of Script -----
//

let numbers = [1, 2, 3, 4, 5]
print("Numbers: \(numbers)")

doubleMapReduce(numbers)
doubleMapReduceChain(numbers)
