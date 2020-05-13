import Foundation

class ExchangeRateViewModel: CurrencyReceivable {
    
    func receiveCurrencies(base: Currency, target: Currency) {
        print(base,target," exchange rate view model received")
    }
    
}
