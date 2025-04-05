import Foundation

enum AccountAction {
    case create, migrate, port
}

struct Account: Identifiable {
    let id: Int
    let action: AccountAction
    let balance: Decimal
}
