//
//  AlarmViewController.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 28/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {

    var tableView: UITableView!
    var viewModel: AlarmViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        title = "Rate Alarms"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm))
        
        viewModel = AlarmViewModel()

        setupTableView()
        
        setupConstraints()
        
    }

    func setupTableView() {
        
        tableView = UITableView()
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
    }
    
    @objc func addAlarm() {
        let newAlarm = Alarm(price: 12.3,
                             baseCurrency: .BRL ,
                             targeCurrency: .DOL,
                             operation: .more)
        
        viewModel.addAlarm(newAlarm)
        
        tableView.reloadData()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
         
         tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
    
}
