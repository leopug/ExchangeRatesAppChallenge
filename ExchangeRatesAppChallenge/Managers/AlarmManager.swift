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
