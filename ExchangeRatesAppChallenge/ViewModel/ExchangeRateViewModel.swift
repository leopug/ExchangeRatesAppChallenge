//
//  ExchangeRateViewModel.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 28/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation
import UIKit


class ExchangeRateViewModel: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currencyManager = CurrencyManager()
    var baseCurrencyDataSource : [String]!
    var targetCurrencyDataSource : [String]!
    
    override init() {
        super.init()
        self.configure()
    }
    
    func configure() {
        baseCurrencyDataSource = currencyManager.currenciesDescription
        targetCurrencyDataSource = currencyManager.currenciesDescription
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
        
        print("selected row \(row) of component \(component) with value \(component==0 ? baseCurrencyDataSource[row] : targetCurrencyDataSource[row])")
    }
    
    
}
