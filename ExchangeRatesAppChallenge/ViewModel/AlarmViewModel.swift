//
//  AlarmViewModel.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 29/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation
import UIKit

class AlarmViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var alarmManager: AlarmManagerModel!
    
    override init() {
        alarmManager = AlarmManagerModel()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmManager.alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = alarmManager.alarms[indexPath.row].price.description
        return cell
    }
    
    func addAlarm(_ newAlarm: Alarm) {
        alarmManager.addAlarm(newAlarm)
    }
    
}
