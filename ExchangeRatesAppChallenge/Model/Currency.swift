//
//  Currency.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 05/05/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import Foundation

enum Currency: String, CaseIterable {
    case BRL
    case DOL
    case EURO
    case UNKNOWN
    
    init(currency: String) {
        self = Currency(rawValue: currency) ?? .UNKNOWN
    }
    
}

extension Currency: Codable {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .BRL
        case 1:
            self = .DOL
        case 2:
            self = .EURO
        case 3:
            self = .UNKNOWN
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .BRL:
            try container.encode(0, forKey: .rawValue)
        case .DOL:
            try container.encode(1, forKey: .rawValue)
        case .EURO:
            try container.encode(2, forKey: .rawValue)
        case .UNKNOWN:
            try container.encode(3, forKey: .rawValue)
        }
    }
}
