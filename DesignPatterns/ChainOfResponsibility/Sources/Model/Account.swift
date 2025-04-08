import Foundation

enum AccountAction {
    case create, migrate, port, unknown
}

struct Account: Identifiable {
    let id: Int
    let action: AccountAction
    let balance: Decimal
}
