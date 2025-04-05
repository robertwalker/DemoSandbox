// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

print("Strategy Pattern Demo")
print("=======================")

class MainApplication {
    func run() {
        // Initialize our context object
        let context = ActivationContext()

        // Iterate the input data
        for account in accounts {
            // Set the approprate stategy based on the action of the account
            switch account.action {
            case .create:
                context.strategy = ActivationStrategyNew()
            case .migrate:
                context.strategy = ActivationStrategyMigrate()
            case .port:
                context.strategy = ActivationStrategyPort()
            }

            // Process the account
            context.activate(account: account)
        }
        print("=======================")
    }
}

// Create some test data to emulate user input or message queue events
let accounts = [
    Account(id: 1, action: .create, balance: 20_000.00),
    Account(id: 2, action: .migrate, balance: 15_000.00),
    Account(id: 3, action: .port, balance: 5_000.00),
    Account(id: 4, action: .migrate, balance: 25_000.00),
    Account(id: 5, action: .create, balance: 30_000.00),
]

// Initialize the application and run
let app = MainApplication()
app.run()
