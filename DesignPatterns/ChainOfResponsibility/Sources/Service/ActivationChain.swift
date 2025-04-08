import Foundation

// Protocol that handlers in the chain adopt
protocol ActivationHandler {
    func activate(account: Account)
}

// Handler for creating an account
class ActivationHandlerNew: ActivationHandler {
    var next: ActivationHandler?

    func activate(account: Account) {
        guard (account.action == .create) else {
            next?.activate(account: account)
            return
        }
        print("Creating an account with ID: \(account.id)")
    }
}

// Handler for migrating an account
class ActivationHandlerMigrate: ActivationHandler {
    var next: ActivationHandler?
    
    func activate(account: Account) {
        guard (account.action == .migrate) else {
            next?.activate(account: account)
            return
        }
        print("Migrating an account with ID: \(account.id)")
    }
}

// Handler for porting an account
class ActivationHandlerPort: ActivationHandler {
    var next: ActivationHandler?
    
    func activate(account: Account) {
        guard (account.action == .port) else {
            next?.activate(account: account)
            return
        }
        print("Porting an account with ID: \(account.id)")
    }
}
