//
//  AlarmManagerModel.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 29/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation


class AlarmManager {
    
    var alarms : [Alarm] = []
    
    func addAlarm(_ newAlarm: Alarm){
        alarms.append(newAlarm)
        return
    }
    
    init() {
        //TODO : -  init with user defaults alarms
    }
    
}
