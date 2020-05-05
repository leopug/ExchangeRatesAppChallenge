//
//  CurrencyManager.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 05/05/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation

class CurrencyManager {
    
    var currenciesDescription : [String] {
        var array : [String] = []
        for currency in Currency.allCases {
            array.append(currency.rawValue)
        }
        return array
    }
    
}
