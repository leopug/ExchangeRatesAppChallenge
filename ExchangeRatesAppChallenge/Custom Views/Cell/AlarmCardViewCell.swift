//
//  AlarmCardViewCell.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 06/05/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import UIKit

class AlarmCardViewCell: UICollectionViewCell {
    static let reuseID = "alarmCellID"
    
    let baseCurrency = ERTitleLabel(fontSize: 16, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ alarm: Alarm) {
        baseCurrency.text = alarm.baseCurrency.rawValue
    }
    
    func configure() {
        addSubview(baseCurrency)
        translatesAutoresizingMaskIntoConstraints = false
        let padding : CGFloat = 8
    
        NSLayoutConstraint.activate([
            
            baseCurrency.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 12),
            baseCurrency.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            baseCurrency.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            baseCurrency.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
