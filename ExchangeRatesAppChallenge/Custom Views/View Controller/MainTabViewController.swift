import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let exchangeView = ExchangeRateViewController()
        exchangeView.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        viewControllers?.append(exchangeView)
        
        let alarmView = AlarmViewController()
        let navigationController = UINavigationController(rootViewController: alarmView)
        alarmView.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        viewControllers = [exchangeView,navigationController]
        
    }


}

