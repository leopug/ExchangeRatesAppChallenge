import Foundation


class AlarmManager {
    
    private var alarms : [Alarm] = []
    
    func addAlarm(_ newAlarm: Alarm){
        alarms.append(newAlarm)
    }
    
    func getAlarms() -> [Alarm] {
        return alarms
    }
    
    init() {
        //TODO : -  init with user defaults alarms
    }
    
}
