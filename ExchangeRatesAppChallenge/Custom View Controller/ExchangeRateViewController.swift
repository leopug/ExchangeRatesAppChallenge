//
//  ExchangeRateViewController.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 28/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import UIKit

class ExchangeRateViewController: UIViewController {

    var exchangeTitle: UILabel!
    var rateValue: UILabel!
    var currencyPicker: CurrencyPickerView!
    var viewModel: ExchangeRateViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        viewModel = ExchangeRateViewModel()
        
        setupExchangeTitle()
        
        setupExchangeValue()
        
        setupCurrencyPicker()
        
        setupConstraints()
        
    }
    
    func setupExchangeTitle(){
        exchangeTitle = UILabel()
        exchangeTitle.translatesAutoresizingMaskIntoConstraints = false
        exchangeTitle.text = "DOLAR'AMA APP"
        exchangeTitle.textAlignment = .center
        exchangeTitle.backgroundColor = .white
        view.addSubview(exchangeTitle)
    }
    
    func setupExchangeValue(){
        rateValue = UILabel()
        rateValue.translatesAutoresizingMaskIntoConstraints = false
        rateValue.text = "49.3"
        rateValue.textAlignment = .center
        rateValue.backgroundColor = .red
        rateValue.font = UIFont(name: "Times new roman", size: 59)
        view.addSubview(rateValue)
    }
    
    func setupCurrencyPicker(){
        currencyPicker = CurrencyPickerView(viewModel: viewModel, frame: CGRect())
        currencyPicker.translatesAutoresizingMaskIntoConstraints = false
        currencyPicker.backgroundColor = .white
        view.addSubview(currencyPicker)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
         
         exchangeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         exchangeTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         exchangeTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         exchangeTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         exchangeTitle.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),

         rateValue.topAnchor.constraint(equalTo: exchangeTitle.bottomAnchor),
         rateValue.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         rateValue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         rateValue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

         currencyPicker.topAnchor.constraint(equalTo: rateValue.bottomAnchor),
         currencyPicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         currencyPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         currencyPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         currencyPicker.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
         currencyPicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
