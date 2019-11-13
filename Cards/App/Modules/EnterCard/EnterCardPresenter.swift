//
//  EnterCardPresenter.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

final class EnterCardPresenter: EnterCardPresenterProtocol, EnterCardInteractorOutputProtocol {
    
    weak private var view: EnterCardViewProtocol?
    var interactor: EnterCardInteractorInputProtocol?
    private let router: EnterCardWireframeProtocol
    private var cardNumber: String?

    init(interface: EnterCardViewProtocol, interactor: EnterCardInteractorInputProtocol?, router: EnterCardWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func enter(number card: String?) {
        view?.cardNumberIcon(isHidden: true)
        view?.informationButton(isHidden: true)
        if let card = card, let paySystem = try? CardChecker.cardType(for: card) {
            view?.paySystem(paySystem.stringValue())
        } else {
            view?.paySystem("")
        }
    }
    
    func check(number card: String?) {
        do {
            if let card = card {
                try CardChecker.checkCard(number: card)
                cardNumber = card
                view?.cardNumber(isValid: true)
            }
        } catch {
            view?.cardNumber(isValid: false)
        }
    }
    
    func showCardInformationScreen() {
        router.showCardInformationScreen(number: cardNumber)
    }
}
