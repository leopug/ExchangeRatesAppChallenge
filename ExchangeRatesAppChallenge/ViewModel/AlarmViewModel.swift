import Foundation

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
        return alarmManager.getAlarms()
    }
    
}
