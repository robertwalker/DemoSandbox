import Foundation

// Declars operations common to all strategies
protocol ActivationStrategy {
    func activate(account: Account)
}

// A concreate strategy for processing "New" accounts
class ActivationStrategyNew: ActivationStrategy {
    func activate(account: Account) {
        print("Creating an account with ID: \(account.id)")
    }
}

// A concreate strategy for processing "Migrating" accounts
class ActivationStrategyMigrate: ActivationStrategy {
    func activate(account: Account) {
        print("Migrating an account with ID: \(account.id)")
    }
}

// A concreate strategy for processing "Porting" accounts
class ActivationStrategyPort: ActivationStrategy {
    func activate(account: Account) {
        print("Porting an account with ID: \(account.id)")
    }
}

// The context defines the interface of interest to clients
class ActivationContext {
    var strategy: ActivationStrategy?
    
    func activate(account: Account) {
        guard let strategy else {
            return
        }
        strategy.activate(account: account)
    }
}
