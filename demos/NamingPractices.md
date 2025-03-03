# Naming Best Practices

## Language Naming Conventions

### Java

- camelCase (variable and method names)
- PascalCase (class names)
- SCREAMING_SNAKE_CASE (constant names)
- camelSnake_Case (acceptable in some test method names)

### Python

- snake_case (variable, function/method and module names)
- PascalCase (class and exception names)

### Other Cases

- kabob-case
- SCREAMING-KABOB-CASE

## Things in Software That We Name

- Files
- Directories
- Programs
- Packages
- Classes
- Variables
- Constants
- Functions/Methods

## Name Length

How long should a variable name be?

```swift
func fibonacciSequence(count: Int) -> [Int] {
    var values = [0, 1]
    
    for i in 0..<count - values.count {
        values.append(values[i] + values[i + 1])
    }
    
    return values
}

let fibonacci = fibonacciSequence(count: 10)
// => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```

- Is the single letter `i` too short as a name used in the `for` loop in the example?
- Is the function argument `count` a good name?
- What about the local variable `values`?
- How about the name of the function itself?

### Variable Names

Variable name length should be proportional to the size of the scope where they are declared.

In the above example the `i` used in the `for` loop may be perfectly fine given that it is used within a scope size of
one line. If the body of the `for` loop was longer, say twenty lines, then a slightly longer name might make sense.
Something like `index` or `loopIndex` might work.

In cases of `for..in` statements used for iterating collections, it makes sense to use the singular form of the
collection's name.

```swift
for person in people {
    print("Hello \(person.firstName) + \(person.lastName)")
}
```

### Function and Class Names

Class names and function names that have a large scope should be inversely proportional to the scope length. As the
scope size increases the name should be shorter, but also more abstract. Rather than `CustomerBankingAccountTransaction`
might be shortened to `Transaction` for example. Just be sure the name is well understood within the context of the
domain where it is used.

Function in the global scope should have short names representing some abstract concept.

Example:

```swift
print("Hello, World")
```

This `print()` function lives in the global scope, and therefore has a very short and abstract name.

Would it make sense for this to have a long name describing exactly what the function does? Something like
`printCustomStringConvertibleObjectToTheSystemConsole()`. This function takes any object that conforms to the
`CustomStringConvertible` protocol and writes the resulting string to the system console. But, does the caller of
`print()` care anything about how it works internally?

Class names follow this same set of rules as functions. After all, classes really are just fancy functions,
and also live within the global scope. They can be called pretty much anywhere; `new MyClass();` in the program.
Inner classes live withing the scope of a class, so just as is the case of methods on a class tend to have somewhat
longer names.

## Noise Words

Avoid using "Noise Words" in names.

Suffixes:

```swift
Product product
ProductData productData
ProductInfo productInfo
```

Prefixes:

```swift
Product aProduct
Product theProductData
```

## Distinguish Names Meaningfully

```Java
List<Account> getActiveAccount();
List<Account> getActiveAccounts();
List<Account> getActiveAccountInfo();
```

If there can be multiple active accounts, then what does `getActiveAccount()` return?

What is the difference between `getActiveAccounts()` and `getActiveAccountInfo()` given that both return a list of
`Account` objects?

These questions can only be answered by digging into the implementations. The names don't provide any meaningful
information about what they actually do.

## Names Should be Pronounceable

Use pronounceable names. Code should be written for readability. The programming languages we use are created for humans
to read, not for computers to read.

Some real world examples:

- `recTypCd`
- `verNo`
- `acctId`
- `vndrAcctId`
- `l1dtRptId`
- `l1dtCustNo`

Potential names:

- `recordTypeCode`
- `versionNumber`
- `accountId`
- `vendorAccountId`
- `reportId`
- `customerNumber`

The `Id` suffix in the above examples are a well understood acronym for `Identifier` so these are fine.

The `l1dt` prefixes in these examples are actually a hold over from the variable names used in a mainframe program or
database column name. This was common in mainframe programs due to limitations of those systems. Find out what that
prefix actually means and maybe use a prefix that expresses the context, and be sure the prefix is pronounceable.
