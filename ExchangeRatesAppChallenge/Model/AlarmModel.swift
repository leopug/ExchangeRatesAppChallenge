//
//  AlarmModel.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 05/05/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation

struct Alarm: Hashable, Codable {
    let identifier: UUID = UUID()
    let price : Decimal
    let baseCurrency : Currency
    let targeCurrency :  Currency
    let operation : AlarmOperations
}
