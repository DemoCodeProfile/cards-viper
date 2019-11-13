//
//  CardChecker.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

enum CardCheckerError: Error {
    case zero
    case length
    case luhnCheck
}

final class CardChecker {
    public enum CardType: Int, CaseIterable {
        case amex = 0
        case visa
        case mastercard
        case discover
        case dinersClub
        case jcb
        case maestro
        case rupay
        case mir
    }
    
    static func checkCard(number card: String) throws {
        guard !checkZero(number: card) else {
            throw CardCheckerError.zero
        }
        guard checkLength(number: card) else {
            throw CardCheckerError.length
        }
        guard luhnCheck(number: card) else {
            throw CardCheckerError.luhnCheck
        }
    }
    
    private static func checkZero(number card: String) -> Bool {
        let range = NSRange(location: 0, length: card.count)
        if let regexp = try? NSRegularExpression(pattern: "^0.*", options: []) {
            return regexp.firstMatch(in: card, options: [], range: range) != nil
        }
        return false
    }
    
    private static func checkLength(number card: String) -> Bool {
        return card.count >= 12 && card.count <= 19
    }
    
    private static func luhnCheck(number card: String) -> Bool {
        var sum = 0
        let reversedCharacters = card.reversed().map { String($0) }
        for (idx, element) in reversedCharacters.enumerated() {
            guard let digit = Int(element) else { return false }
            switch ((idx % 2 == 1), digit) {
            case (true, 9): sum += 9
            case (true, 0...8): sum += (digit * 2) % 9
            default: sum += digit
            }
        }
        return sum % 10 == 0
    }
    
    fileprivate class func regularExpression(for cardType: CardType) -> String {
        switch cardType {
        case .amex:
            return "^3[47][0-9]{5,}$"
        case .dinersClub:
            return "^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"
        case .discover:
            return "^6(?:011|5[0-9]{2})[0-9]{3,}$"
        case .jcb:
            return "^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"
        case .mastercard:
            return "^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$"
        case .visa:
            return "^4[0-9]{6,}$"
        case .maestro:
            return "^(5018|5020|5038|6304|6759|6761|6763|6762)[0-9]{8,15}$"
        case .rupay:
            return "^6[0-9]{15}$"
        case .mir:
            return "^220[0-9]{13}$"
        }
    }
    
    fileprivate class func suggestionRegularExpression(for cardType: CardType) -> String {
        switch cardType {
        case .amex:
            return "^3[47][0-9]+$"
        case .dinersClub:
            return "^3(?:0[0-5]|[68][0-9])[0-9]+$"
        case .discover:
            return "^6(?:011|5[0-9]{2})[0-9]+$"
        case .jcb:
            return "^(?:2131|1800|35[0-9]{3})[0-9]+$"
        case .mastercard:
            return "^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$"
        case .visa:
            return "^4[0-9]+$"
        case .maestro:
            return "^(5018|5020|5038|6304|6759|6761|6763|6762)[0-9]+$"
        case .rupay:
            return "^6[0-9]+$"
        case .mir:
            return "^220[0-9]+$"
        }
    }
    
    class func cardType(for cardNumber: String, suggest: Bool = false) throws -> CardType? {
        var foundCardType: CardType?
        for cardType in CardType.allCases {
            let regex = suggest ? suggestionRegularExpression(for: cardType) : regularExpression(for: cardType)
            
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            
            if predicate.evaluate(with: cardNumber) {
                foundCardType = cardType
                break
            }
        }
        return foundCardType
    }
}

extension CardChecker.CardType {
    func stringValue() -> String {
        switch self {
        case .amex:
            return "American Express".translate()
        case .visa:
            return "Visa".translate()
        case .mastercard:
            return "Mastercard".translate()
        case .discover:
            return "Discover".translate()
        case .dinersClub:
            return "Diner's Club".translate()
        case .jcb:
            return "JCB".translate()
        case .maestro:
            return "Maestro".translate()
        case .rupay:
            return "Rupay".translate()
        case .mir:
            return "Mir".translate()
        }
    }
    
    init?(string: String) {
        switch string.lowercased() {
        case "american express":
            self.init(rawValue: 0)
        case "visa":
            self.init(rawValue: 1)
        case "mastercard":
            self.init(rawValue: 2)
        case "discover":
            self.init(rawValue: 3)
        case "diner's club":
            self.init(rawValue: 4)
        case "jcb":
            self.init(rawValue: 5)
        case "maestro":
            self.init(rawValue: 6)
        case "rupay":
            self.init(rawValue: 7)
        case "mir":
            self.init(rawValue: 8)
        default:
            return nil
        }
    }
}
