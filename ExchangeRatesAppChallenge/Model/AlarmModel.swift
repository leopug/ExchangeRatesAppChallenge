//
//  AlarmModel.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 05/05/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation

struct Alarm {
    var price : Decimal
    var baseCurrency : Currency
    var targeCurrency :  Currency
    var operation : Operations
}
