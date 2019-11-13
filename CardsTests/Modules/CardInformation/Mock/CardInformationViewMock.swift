//
//  CardInformationViewMock.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

@testable import Cards

class CardInformationViewMock: CardInformationViewProtocol {
    
    var presenter: CardInformationPresenterProtocol?
    
    var cardInformationDatas: [CardInformationData] = []
    var error: String = ""
    var isStartLoadingProcess: Bool = false
    
    func visibleCardList(_ list: [CardInformationData]) {
        cardInformationDatas = list
    }
    
    func error(description: String) {
        error = description
    }
    
    func showLoadingProcess() {
        isStartLoadingProcess = true
    }
}
