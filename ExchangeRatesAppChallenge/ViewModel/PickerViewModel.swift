//
//  ExchangeRateViewModel.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 28/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation
import UIKit

protocol CurrencyReceivable {
    
    func receiveCurrencies(base: Currency, target: Currency)
    
}

class PickerViewModel: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currencyManager = CurrencyManager()
    var baseCurrencyDataSource : [String]!
    var targetCurrencyDataSource : [String]!
    var currencyReceivable: CurrencyReceivable!
    var baseRow = 0
    var targetRow = 0
    
    init(currencyReceivable: CurrencyReceivable) {
        super.init()
        self.currencyReceivable = currencyReceivable
        self.configure()
    }
    
    func configure() {
        baseCurrencyDataSource = CurrencyManager.currenciesDescription
        targetCurrencyDataSource = CurrencyManager.currenciesDescription
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return baseCurrencyDataSource.count
        } else {
            return targetCurrencyDataSource.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return baseCurrencyDataSource[row]
        } else {
            return targetCurrencyDataSource[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        print("selected row \(row) of component \(component) with value \(component==0 ? baseCurrencyDataSource[row] : targetCurrencyDataSource[row])")
        
        if component == 0 {
            baseRow = row
        } else {
            targetRow = row
        }
        if(baseRow != targetRow) {
        currencyReceivable.receiveCurrencies(base: Currency.getCurrency(currency: baseCurrencyDataSource[baseRow]), target: Currency.getCurrency(currency: targetCurrencyDataSource[targetRow]))
        }
    }
    
    
}
