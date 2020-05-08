import Foundation

enum AlarmOperations: String, CaseIterable {
    case more
    case moreOrEqual
    case less
    case lessOrEqual
}

extension AlarmOperations: Codable {
    
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
            self = .more
        case 1:
            self = .moreOrEqual
        case 2:
            self = .less
        case 3:
            self = .lessOrEqual
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .more:
            try container.encode(0, forKey: .rawValue)
        case .moreOrEqual:
            try container.encode(1, forKey: .rawValue)
        case .less:
            try container.encode(2, forKey: .rawValue)
        case .lessOrEqual:
            try container.encode(3, forKey: .rawValue)
        }
    }
    
}
