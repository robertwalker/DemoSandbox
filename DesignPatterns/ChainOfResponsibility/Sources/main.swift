// The Swift Programming Language
// https://docs.swift.org/swift-book

print("Chain of Responsibility Pattern Demo")
print("====================================")

class MainApplication {
    func run() {
        // Setup the Chain of Responsibility
        let mainHandler = ActivationHandlerNew()
        let handler2 = ActivationHandlerMigrate()
        let handler3 = ActivationHandlerPort()

        mainHandler.next = handler2
        handler2.next = handler3

        for account in accounts {
            mainHandler.activate(account: account)
        }
        print("====================================")
    }
}

// Create some test data to emulate user input or message queue events
let accounts = [
    Account(id: 1, action: .create, balance: 20_000.00),
    Account(id: 2, action: .migrate, balance: 15_000.00),
    Account(id: 3, action: .port, balance: 5_000.00),
    Account(id: 4, action: .migrate, balance: 25_000.00),
    Account(id: 5, action: .create, balance: 30_000.00),
    Account(id: 6, action: .unknown, balance: 0.00),
]

let app = MainApplication()
app.run()
