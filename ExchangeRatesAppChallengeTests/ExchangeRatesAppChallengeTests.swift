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
        
        alarmManager.addAlarm(Alarm(price: 10.2,
                                    baseCurrency: Currency.BRL,
                                    targeCurrency: Currency.DOL,
                                    operation: AlarmOperations.more))
        
        XCTAssertEqual(alarmPreviousCount+1, alarmManager.getAlarms().count)
    }

}
