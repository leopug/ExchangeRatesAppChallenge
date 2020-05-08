//
//  OperationPickerView.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 08/05/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import UIKit

class OperationPickerView: UIView {

    typealias OperationPickerViewModel = UIPickerViewDelegate & UIPickerViewDataSource
    
    var picker: UIPickerView!
    weak var viewModel: OperationPickerViewModel!
    
    init(viewModel:OperationPickerViewModel, frame: CGRect) {
        super.init(frame: frame)
        self.viewModel = viewModel
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        picker = UIPickerView()
        picker.dataSource = viewModel
        picker.delegate = viewModel
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        configureConstraints()
        
    }
        
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
        
            picker.topAnchor.constraint(equalTo: self.topAnchor),
            picker.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            picker.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            picker.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
        
    }
    
}
