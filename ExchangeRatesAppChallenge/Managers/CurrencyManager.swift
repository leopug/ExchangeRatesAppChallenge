import Foundation

class CurrencyManager {
    
    static var currenciesDescription : [String] {
        var array : [String] = []
        for currency in Currency.allCases {
            array.append(currency.rawValue)
        }
        return array
    }
    
    static var currenciesOperationsDescription: [String] {
        var array : [String] = []
        for operation in AlarmOperations.allCases {
            array.append(operation.rawValue)
        }
        return array
    }
    
}
