//
//  CurrencyPickerView.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 28/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import UIKit

class CurrencyPickerView: UIView {

    typealias CurrencyPickerViewModel =
        UIPickerViewDelegate & UIPickerViewDataSource
    
    var picker: UIPickerView!
    var viewModel: CurrencyPickerViewModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init(viewModel: CurrencyPickerViewModel, frame: CGRect) {
        super.init(frame: frame)
        self.viewModel = viewModel
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        setupBaseCurrencyPicker()
        setupTargetCurrencyPicker()
        setupConstraints()
    }
    
    func setupBaseCurrencyPicker() {
        picker = UIPickerView()
        picker.delegate = viewModel
        picker.dataSource = viewModel
        picker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picker)
    }
    
    func setupTargetCurrencyPicker() {
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
         
         picker.topAnchor.constraint(equalTo: self.topAnchor),
         picker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
         picker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
         picker.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
         picker.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),

        ])
    }
    

}
