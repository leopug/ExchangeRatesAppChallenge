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
    weak var viewModel: CurrencyPickerViewModel!
    var labelTo: UILabel!
    
    init(viewModel: CurrencyPickerViewModel, frame: CGRect) {
        super.init(frame: frame)
        self.viewModel = viewModel
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        setupPicker()
        setupLabelTo()
        setupConstraints()
    }
    
    func setupLabelTo(){
        labelTo = UILabel()
        labelTo.translatesAutoresizingMaskIntoConstraints = false
        labelTo.text = "TO"
        labelTo.textAlignment = .center
        addSubview(labelTo)
    }
    
    func setupPicker() {
        picker = UIPickerView()
        picker.delegate = viewModel
        picker.dataSource = viewModel
        picker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picker)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
         
         picker.topAnchor.constraint(equalTo: self.topAnchor),
         picker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
         picker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
         picker.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
         picker.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
         
         labelTo.topAnchor.constraint(equalTo: self.topAnchor),
         labelTo.centerXAnchor.constraint(equalTo: picker.safeAreaLayoutGuide.centerXAnchor),
         labelTo.centerYAnchor.constraint(equalTo: picker.safeAreaLayoutGuide.centerYAnchor)

        ])
    }
    

}
