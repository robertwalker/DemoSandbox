# Handling Errors and Exceptions

## Error Handling Before Exceptions (C/UNIX Shell, etc.)

### Return and Exit Status Codes

```c
#include <stdio.h>

int main()
{
    FILE* fptr = fopen("filename.txt", "r");
    if (fptr == NULL) {
        // Print error message if file opening fails
        perror("Error opening the file");
        return 1;
    }

    // Perform file operations

    if (ferror(fptr)) {
        // Print error message if file operation fails
        perror("Error occurred during file operations");
        // Handle the error
    }
    // Close the file
    fclose(fptr);
    return 0;
}
```

#### Key Takeaways

1. The `main` function returns `0` when successful or `1` if unable to open the file for reading.
2. The C language does not include exceptions. As such, there is no `try...catch` construct. Which means that there
   is no `finally` block or "try with resource" to ensure the file resource gets closed gracefully. The programmer has
   the responsibility for closing resources before exiting the function that opened them.
3. The `fopen()` function returns `NULL` if an error occurs attempting to open a file.
4. The `ferror()` is used to test for errors using the file pointer.
5. If an error occurs while attempting to read data from the file the error must be handled in some way.

## Exception Handling (Java, C#, etc.)

### The Log and Throw Anti-Pattern

```java
@RequiredArgsConstructor
@Slf4j
public Class DemoService {
    private final RiskyService service;

    public void doSomething() {
        try {
            return service.someRiskyMethod();
        } catch (IOException e) {
            log.error("Something went wrong", e);
            throw new RuntimeException("Something went wrong", e);
        }
    }
}
```

#### Problems with "Log and Throw"

1. Duplicate logging: Upstream callers may not realize the exception has been logged here, so may end up catching the
   runtime exception thrown here and logging it again.
2. Loss of context: Rethrown exceptions may lose context making it difficult to pinpoint the root cause of the
   original exception.
3. Inefficient Error Handling: Catching exceptions and generating stack traces is not a "free" operation. It is
   important to understand the performance characteristics of exception handling.

#### Best Practices

1. Choose log or throw: If you choose to log, then handle the exception in a meaningful way and don't throw. If you
   choose to rethrow then don't log and let the caller log and handle the exception.
2. Log at the appropriate level: Log where you have the most context about the error and can handle the exception in a
   meaningful way.
3. Avoid catching the generic `Exception` type: Try to catch specific exception types whenever possible. The
   `IOException` is used in the `catch` block in the above example. Other exception types should be handled further
   up the call stack.

## Checked Exceptions (Java)

There are two basic types of exceptions in Java:

- Checked Exceptions
- Unchecked Exceptions (i.e., Runtime Exceptions)

1. Checked exceptions are rare in computer programming languages. Java is the only mainstream language I am aware of
that includes them.
2. Checked exceptions must be handled (or propagated) at compile-time.
3. Checked exceptions, when rethrown, change the signature of the method.

Example of handling checked exceptions:

```java
@Slf4j
public class TextFileReader {
    public void readTextFile() throws IOException {
        // Path to the file
        String path = "example.txt";

        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(path));
            String line;
            while ((line = br.readLine()) != null) {
                log.info(line);
            }
        } catch (IOException e) {
            log.error("Failed to read text file", e);
        } finally {
            if (br != null) {
                br.close();
            }
        }
    }
}
```

## Simplifying Resource Management

The previous example illustrates the main problem with Checked Exceptions, and why languages like C# decided to not to
include them.

Notice that the method signature includes throwing the `IOException` even though the exception appears to be handled
by the `try...catch...finally` syntax. The problem is that closing a `BufferedReader` can also throw an `IOException`.
This means that the upstream caller must also handle the checked `IOException` at compile-time.

The options would be to either wrap `br.close()` inside a nested `try...catch` to handle the exception, or throw a
`RuntimeException` so that the caller wouldn't be required to handle it at compile-time.

Thankfully, more recent versions of Java have provided a solution for this problem called "Try with Resource".

### Example of Try with Resource

```java
@Slf4j
public class TextFileReader {
    public void readTextFileWithResource() {
        // Path to the file
        String path = "example.txt";

        // Try with Resource
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = br.readLine()) != null) {
                log.info(line);
            }
        } catch (IOException e) {
            log.error("Failed to read text file at path: {}", path, e);
        }
    }
}
```

## Example Anti-patterns

- [Java Exception Anti-Patterns](https://gaetanopiazzolla.github.io/java/exception/patterns/2024/07/01/java-exception-anti-patterns.html)
- [Avoid Using Exceptions as Control Flow (DZone)](https://dzone.com/articles/exceptions-as-controlflow-in-java)

## Seems Like Every Rule Has Exceptions

In some scenarios where a library or framework method is internally complex it is acceptable, and preferable, to log
details about the various problems that can occur that would otherwise be hidden from the caller.

In these cases it would be good practice to log the information (usually at the DEBUG or TRACE level), then throw an
appropriate exception to represent the specific error condition. The ERROR and WARN level logging should be propagated
to the caller.

## The Old Becomes New Again

After years of experience with the complexity and complications of exception based error handling, some contemporary
programming languages have opted to adopted errors, or `return codes`, and exclude exceptions either entirely, or
partially.

I will include a couple of examples here, but there are a number of other languages adopting these techniques.

## Go Language (Google)

Go has adopted the use of `return codes` for primary error handling.

```go
f, err := os.Open("filename.ext")
if err != nil {
    log.Fatal(err)
}
// do something with the open *File f
```

Go supports this by taking advantage of multiple return values for functions. If the file is opened successfully then
a file handle, `f` is returned, and `err` will be `nil`.

As mentioned earlier that some languages exclude exceptions entirely, and some partially. Go is of the later variety.

Go has a `panic` statement. This is actually much like `throw` in Java. While Go does not include a `try...catch`
syntax, a `panic` is still very much like throwing an exception, and are generally handled using `defer` blocks.

```go
func main {
    defer func() {
        if r := recover(); r != nil {
            fmt.Println("Recovered from panic:", r)
        }
    }()

    panic("Something went wrong")
}
```

Go does not suffer the performance issues related to unwinding the stack, and generating stack traces, by using
`return codes` for all but the most critical error conditions.

For more see [Error handling and Go](https://go.dev/blog/error-handling-and-go)

## Swift Error Handling (Apple)

The Swift language does not include exceptions in any form, opting for throwing `Error` types instead. In practice,
thanks to some "Syntactic Sugar," Swift error handling resembles traditional exception handling in several ways.

Swift's error handling, like, Java is a relatively complex, so I will include a few examples here, but the official
documentation on
[Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
has a detailed explanation.

### Representing and Throwing Errors

```swift
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
```

```swift
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```

### Handling Errors

Swift defines these two distinct types of functions:

- Throwing functions
- Non-throwing functions

```swift
func canThrowErrors() throws -> String

func cannotThrowErrors() -> String
```

Unlike Java (and similar languages) Swift's "Non-throwing functions" are guaranteed to never throw errors. They can be
used confidently without needing error handling.

In contrast "throwing functions" **require** error handling for any potential errors using the `try` keyword. Failure to
handle potential errors results in a compile-time error.

It is also not possible for any type of Swift function to return a `nil` result. Swift has no concept of null
references. More on this later.

It is typical to represent errors using `enum` types that conform to the `Error` protocol (Protocols are akin to Java
interfaces). However, other types (such as `struct`) can also be used to represent errors by conforming to the `Error`
protocol.

Example using `do...try...catch` blocks:

```swift
do {
    try buyFavoriteSnack(person: person, vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}
```

### Optional Values

As hinted at earlier, `Optional` values are the mechanism that Swift uses to represent that a variable has no value, or
a function returns a value that is empty.

```swift
enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}
```

```swift
// Here's an optional integer value
var value: Int?

// Which is shorthand for
var value: Optional<Int> = nil
```

```swift
// The above values must be unwrapped before using the wrapped integer
if let value {
    // Do something with the wrapped integer
} else {
    // Handle the case where the optional contains no value
}

// Or using the preferred guard style syntax
guard let value else {
    // Handle the case where the optional contains no value
    return
}
// Do something with the integer by the guard above
```

```swift
// Setting an optional that has a value to have no value
// The nil constant is used to represent or set an optional with no value
// The nil constant is not a null reference
var value: Int? = 5
value = nil
```

### Converting Errors to Optional Values

```swift
func someThrowingFunction() throws -> Int {
    // ...
}


let x = try? someThrowingFunction()


let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
```

### Disabling Error Propagation

Sometimes it is possible to know that a throwing function will not throw. In these cases it can be useful to disable the
propagatoion of errors. On those occations use `try!` to stop the propagation of the error and wrap the call in a
runtime assertion that no error will be thorwn. If an error is actually thorwn then a runtime error will be thrown.

```swift
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
```

Note that the application would actually crash in case that resource file could not be loaded. Crashing is the
approprate action in this case, given that the image is delivered as part of the application bundle.

For more see [Error Handling in Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
