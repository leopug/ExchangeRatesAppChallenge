import Foundation

struct CurrencyManager {
    
    static let currenciesDescription = Currency.allCases.filter { $0 != .UNKNOWN }.map { $0.rawValue }

    static let currenciesOperationsDescription = AlarmOperations.allCases.map { $0.rawValue }
    
}
