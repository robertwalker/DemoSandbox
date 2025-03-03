# Functional Style in OOP Languages

Many modern programming languages have adopted some of the style and characteristics of functional programming
languages. This demo with show some of these basic functional language techniques.

Here's a list of the functions covered here:

- `forEach()`
- `map()`
- `reduce()`
- `filter()`
- `flatMap()`
- `compactMap()`

## Function `forEach()`

The `forEach()` function can be used as an alternative to a `for` or `for...in` loops. The `forEach()` function takes a
single argument that is the "lambda" function to be called for each item in the given input array.

Each of the following implementations will use the same input array `[1, 2, 3, 4, 5]` of integer values.

### JavaScript `forEach()`

#### Using a traditional C style `for` loop in Javascript

```javascript
// Given this array of numbers:
const numbers = [1, 2, 3, 4, 5];

// Traditional C style for loop
function doubledFor(numbers) {
  let array = [];
  for (i = 0; i < numbers.length; i++) {
    array.push(numbers[i] * 2);
  }
}
// => Doubles: [ 2, 4, 6, 8, 10 ]
```

#### Using a `for...in` style loop in Javascript

Note: Javascript uses the `for...in` syntax for another purpose. The `for...of` syntax is used for iterating arrays.

```javascript
// Given this array of numbers:
const numbers = [1, 2, 3, 4, 5];

// A for...in style loop
function doubledForIn(numbers) {
  let array = [];
  for (number of numbers) {
    array.push(number * 2);
  }
}
// => Doubles: [ 2, 4, 6, 8, 10 ]
```

#### Using `forEach()` to double numbers in an array (non-mutating) in Javascript

The same functionality can accomplished using a functional programming style using the `forEach()` function:

Note: Javascript provides both non-mutating and mutating (i.e., in-place) options.

```javascript
// Given this array of numbers:
const numbers = [1, 2, 3, 4, 5];

// Example non-mutating
function doubledForEach(numbers) {
  let array = [];
  numbers.forEach((n) => {
    array.push(n * 2);
  });
}
// => Doubles: [ 2, 4, 6, 8, 10 ]
```

#### Using `forEach()` to double numbers in an array (mutating) in Javascript

```javascript
// Given this array of numbers:
let numbers = [1, 2, 3, 4, 5];

// Example mutating
function doubledForEachMutating(numbers) {
  numbers.forEach((n, index, array) => {
    array[index] = n * 2;
  });
}
// => Doubles: [ 2, 4, 6, 8, 10 ]
```

What would happen if `doubledForEach(numbers)` was called after `doubledForEachMutating(numbers)`?

### Swift `forEach()`

#### Using a `for..in` style loop in Swift

Note: Swift does not include traditional C style `for` loops.

```swift
// Given this list of numbers:
let numbers = [1, 2, 3, 4, 5];

// A for...in style loop
func doubleForIn(_ numbers: [Int]) {
    var array: [Int] = []
    for number in numbers {
        array.append(number * 2)
    }
}
// => Doubles: [2, 4, 6, 8, 10]
```

#### Using a `forEach()` function in Swift

The same functionality can accomplished using a functional programming style using the `forEach()` function:

```swift
// Given this list of numbers:
let numbers = [1, 2, 3, 4, 5];

// Functional style forEach()
func doubleForEach(_ numbers: [Int]) {
    var array: [Int] = []
    numbers.forEach() { number in
        array.append(number * 2)
    }
}
// => Doubles: [2, 4, 6, 8, 10]
```

### Java `forEach()`

```java
// TODO
```

## Function `map()`

The `map()` function applies a provided closure to each array element, creating a new array with the transformed
results. It’s an alternative to `forEach()` for transforming input arrays. For instance, doubling each number in an
array is a suitable use case for `map()`.

### Javascript `map()`

```javascript
// Given this list of numbers:
const numbers = [1, 2, 3, 4, 5];

// Functional style map transformation
function doubledMap(numbers) {
  const array = numbers.map((n) => {
    return n * 2;
  });
}
// => Doubles: [2, 4, 6, 8, 10]
```

### Swift `map()`

```swift
// Given this list of numbers
let numbers = [1, 2, 3, 4, 5];

// Functional style map transformation
func doubleMap(_ numbers: [Int]) {
    let array = numbers.map() { number in
        number * 2
    }
}
// => Doubles: [2, 4, 6, 8, 10]
```

```swift
// Given this list of names:
let names = ["Jack Reacher", "Ethan Hunt", "John Wick", "John Patrick Ryan"]

// Functional style map transformation from First Last names to Last, First
func reversedNames(_ names: [String]) {
    let reversed = names.map() { name in
        return nameInLastFirst(name)
    }
}
// => Names in Last, First: ["Reacher, Jack", "Hunt, Ethan", "Wick, John", "Ryan, John Patrick"]
```

### Java `map()`

```java
// TODO
```

## Function `reduce()`

The `reduce()` function is use to "reduce" an array of values to a single value. The examples here will take an array of
integers, multiply each by 2 then return the sum of all the doubled values as a single integer.

### Javascript `reduce()`

```javascript
// Given this list of numbers
const numbers = [1, 2, 3, 4, 5];

// Functional style map/reduce
function doubledMapReduce(numbers) {
  const array = numbers.map((n) => {
    return n * 2;
  });
  const sum = array.reduce(
    (accumulator, currentValue) => accumulator + currentValue,
    0
  );
}
// => Doubles: [ 2, 4, 6, 8, 10 ]
// => Sum of double values: 30
```

### Swift `reduce()`

```swift
// Given this list of numbers
let numbers = [1, 2, 3, 4, 5]

// Functional style map/reduce
func doubleMapReduce(_ numbers: [Int]) {
    let array = numbers.map() { number in
        number * 2
    }
    let sum = array.reduce(0, { x, y in
        x + y
    })
}
// => Doubles: [2, 4, 6, 8, 10]
// => Sum of doubles: 30

```

### Java `reduce()`

```java
// TODO
```

## Function Chaining

The `map()` and `reduce(0)` can be chained together in a single statement.

```Javascript
// Given this list of numbers
const numbers = [1, 2, 3, 4, 5];

// Functional style map/reduce chaining
function doubledMapReduceChain(numbers) {
  const sum = numbers
    .map((n) => {
      return n * 2;
    })
    .reduce((accumulator, currentValue) => accumulator + currentValue, 0);
}
// => Sum of double values: 30
```

```swift
// Given this list of numbers
let numbers = [1, 2, 3, 4, 5]

// Functional style map/reduce chaining
func doubleMapReduceChain(_ numbers: [Int]) {
    let sum = numbers.map() { number in
        number * 2
    }.reduce(0, { x, y in
        x + y
    })
}
// => Sum of doubles: 30
````

```java
// TODO - Java
```

## Function `filter()`

The `filter()` function creates a new array by calling a function that uses a predicate condition. Where the condition
is `true` the element is included in the resulting array, otherwise the element is discarded.

### Javascript `filter()`

```javascript
// Given this list of numbers
const numbers = [1, 2, 3, 4, 5];

// Functional style filter on numbers
function oddNumbers(numbers) {
  const array = numbers.filter((n) => {
    return n % 2 > 0;
  });
}
// => Odd numbers: [ 1, 3, 5 ]
```

```javascript
// Given this list of names
const names = ["Jack Reacher", "Ethan Hunt", "John Wick", "John Patrick Ryan"];

// Functional style filter on strings
function namesStartingWithJ(names) {
  const array = names.filter((n) => {
    return n.startsWith("J");
  });
}
// => Names starting with "J": [ 'Jack Reacher', 'John Wick', 'John Patrick Ryan' ]
```

### Swift `filter()`

```swift
// Given this list of numbers
let numbers = [1, 2, 3, 4, 5]

// Functional style filter on numbers
func oddNumbers(_ numbers: [Int]) {
    let array = numbers.filter() { $0 % 2 > 0 }
}
// => Odd numbers: [1, 3, 5]
```

```swift
// Given this list of names
let names = ["Jack Reacher", "Ethan Hunt", "John Wick", "John Patrick Ryan"]

// Functional style filter on strings
func namesStartingWithJ(_ names: [String]) {
    print("\nFunctional style filter strings:")
    let array = names.filter() { $0.starts(with: "J") }
    print(#"Names starting with "J": \#(array)"#)
}
// => Names starting with "J": ["Jack Reacher", "John Wick", "John Patrick Ryan"]
```

### Java `filter()`

```java
// TODO
```

## Function `flatMap()`

The `flatMap()` function transforms an array containing arrays as elements and return an array containing all elements
from all array elements. This has the effect of "flattening" the array of arrays to an array of elements.

### Javascript `flatMap()`

```javascript
// Given an array of arrays containing integers
const numbers = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]];

// Functional style flatMap transformation
function doubledFlatMap(numbers) {
  const array = numbers.flatMap((n) => n).map((n) => n * 2);
}
// => Doubles flattened: [ 2, 4,  6,  8, 10, 12, 14, 16, 18, 20 ]
```

### Swift `flatMap()`

```swift
// Given an array of arrays containing integers
let numbers = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]

// Functional style flat map transformation
func doubleFlatMap(_ numbers: [[Int]]) {
    let array = numbers.flatMap() { $0 }.map() { $0 * 2 }
}
// => Doubles flattened: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```

### Java `flatMap()`

```java
// TODO
```

## Function `compactMap()`

Swift, in particular, provides the `compactMap()` function. This alternative to the `map()` function is suitable when
transforming arrays that contain `Optional` values. The `compactMap()` function will return an array by eliminating
elements that are `nil` optionals.

Unlike the `map()` function the resulting array may contain fewer elements than the source array.

### Swift `compactMap()`

```swift
// Given an array containing strings representing possible integer values
let possibleNumbers = ["1", "2", "three", "///4///", "5"]

// Functional style compact map transformation
func compactMapStringToInt(_ possibleNumbers: [String]) {
    let mapped: [Int?] = possibleNumbers.map() { Int($0) }
    let compactMapped = mapped.compactMap() { $0 }
}
// => Mapped: [Optional(1), Optional(2), nil, nil, Optional(5)]
// => Compact mapped: [1, 2, 5]
```
