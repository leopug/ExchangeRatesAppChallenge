import Foundation
import UIKit

protocol CurrencyReceivable {
    func receiveCurrencies(base: Currency, target: Currency)
}

class CurrencyPickerHandler: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var baseCurrency : [String]!
    var targetCurrency : [String]!
    var currencyReceivable: CurrencyReceivable!
    var baseRow = 0
    var targetRow = 0
    
    init(currencyReceivable: CurrencyReceivable) {
        super.init()
        self.currencyReceivable = currencyReceivable
        self.configure()
    }
    
    func configure() {
        baseCurrency = CurrencyManager.currenciesDescription
        targetCurrency = CurrencyManager.currenciesDescription
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return baseCurrency.count
        } else {
            return targetCurrency.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return baseCurrency[row]
        } else {
            return targetCurrency[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            baseRow = row
        } else {
            targetRow = row
        }
        
        if(baseRow != targetRow) {
        currencyReceivable?.receiveCurrencies(base: Currency(currency: baseCurrency[baseRow]), target: Currency(currency: targetCurrency[targetRow]))
        }
    }
}
