//
//  AlarmViewModel.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 29/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation
import UIKit

protocol AlarmOrchestrator {
    func addAlarm(_ newAlarm:Alarm)
    func getAlarms() -> [Alarm]
}

class AlarmViewModel: NSObject, AlarmOrchestrator {
    
    var alarmManager: AlarmManager = AlarmManager()
    
    func addAlarm(_ newAlarm: Alarm) {
        alarmManager.addAlarm(newAlarm)
    }
    
    func getAlarms() -> [Alarm] {
        return alarmManager.alarms
    }
    
}
