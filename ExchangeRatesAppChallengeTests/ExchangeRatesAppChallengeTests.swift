import XCTest
@testable import ExchangeRatesAppChallenge

class ExchangeRatesAppChallengeTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testAddAlarmAlarmManager(){
        let alarmManager : AlarmManager = AlarmManager()
        let alarmPreviousCount = alarmManager.getAlarms().count
        let alarm = Alarm(price: 10.2,
                          baseCurrency: Currency.BRL,
                          targeCurrency: Currency.DOL,
                          operation: AlarmOperations.more)
        
        alarmManager.addAlarm(alarm)
        
        XCTAssertEqual(alarmPreviousCount+1, alarmManager.getAlarms().count)
        XCTAssertEqual(alarm, alarmManager.getAlarms().last)
    }
    
    func testCheckAddedAlarm() {
        let alarmManager : AlarmManager = AlarmManager()
        let alarm = Alarm(price: 10.2,
                          baseCurrency: Currency.BRL,
                          targeCurrency: Currency.DOL,
                          operation: AlarmOperations.more)
        
        alarmManager.addAlarm(alarm)
        
        XCTAssertEqual(alarm, alarmManager.getAlarms().last)
    }
    
}
