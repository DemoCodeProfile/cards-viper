//
//  EnterCardViewMock.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

@testable import Cards

class EnterCardViewMock: EnterCardViewProtocol {
    var presenter: EnterCardPresenterProtocol?
    
    var isValidCardNumber: Bool?
    var isHiddenCradNumberIcon: Bool?
    var isHiddenInforamationButton: Bool?
    var nameCardType: String?
    
    
    func cardNumber(isValid: Bool) {
        isValidCardNumber = isValid
    }
    
    func cardNumberIcon(isHidden: Bool) {
        isHiddenCradNumberIcon = isHidden
    }
    
    func informationButton(isHidden: Bool) {
        isHiddenInforamationButton = isHidden
    }
    
    func paySystem(_ name: String) {
        nameCardType = name
    }
}
