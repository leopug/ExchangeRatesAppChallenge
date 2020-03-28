//
//  ViewController.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 28/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let exchangeView = ExchangeRateViewController()
        exchangeView.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        viewControllers?.append(exchangeView)
        
        let alarmView = AlarmViewController()
        alarmView.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        viewControllers = [exchangeView,alarmView]
        
    }


}

