func doubleMap(_ numbers: [Int]) {
    print("\nFunctional style map transformation:")
    let array = numbers.map() { number in
        number * 2
    }
    print("Doubles: \(array)")
}

func reversedNames(_ names: [String]) {
    print("\nFunctional style map transformation from First Last names to Last, First:")
    let reversed = names.map() { name in
        return nameInLastFirst(name)
    }
    print("Names in Last, First: \(reversed)")
}

// ---- Private Utility Functions --- //

private func nameInLastFirst(_ name: String) -> String {
        guard name.count > 0 else {
            return ""
        }
        var components = name.split(separator: " ")
        let last = components.removeLast()
        let rest = components.joined(separator: " ")
        return "\(last), \(rest)"
}

//
// ----- Start of Script -----
//

let numbers = [1, 2, 3, 4, 5]
let names = ["Jack Reacher", "Ethan Hunt", "John Wick", "John Patrick Ryan"]
print("Numbers: \(numbers)")
print("Names: \(names)")

doubleMap(numbers)
reversedNames(names)
