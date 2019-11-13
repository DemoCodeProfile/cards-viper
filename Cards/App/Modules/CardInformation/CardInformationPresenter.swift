//
//  CardInformationPresenter.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

class CardInformationPresenter: CardInformationPresenterProtocol, CardInformationInteractorOutputProtocol {
    
    weak var view: CardInformationViewProtocol?
    var interactor: CardInformationInteractorInputProtocol?
    private let router: CardInformationWireframeProtocol
    private let cardNumber: String?

    init(
        interface: CardInformationViewProtocol,
        interactor: CardInformationInteractorInputProtocol?,
        router: CardInformationWireframeProtocol,
        cardNumber: String?
    ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.cardNumber = cardNumber
    }
    
    func receivedCardInformation(_ result: Result<CardNumber, ResponseError>) {
        switch result {
        case .success(let cardNumber):
            let list = createCardInformationList(number: cardNumber)
            view?.visibleCardList(list)
        case .failure(let error):
            view?.error(description: error.description)
        }
    }
    
    func receiveCardInformation() {
        view?.showLoadingProcess()
        interactor?.receiveCardInformation(number: cardNumber)
    }
    
    private func createCardInformationList(number card: CardNumber) -> [CardInformationData] {
        var result: [CardInformationData] = []
        if let number = cardNumber {
            result.append(.description("Card number".translate(), number))
        }
        if let brand = card.brand {
            result.append(.description("Brand".translate(), brand))
        }
        if let scheme = card.scheme {
            result.append(.description("Scheme".translate(), scheme))
        }
        if let prepaid = card.prepaid {
            result.append(.description("Prepaid".translate(), prepaid ? "Yes".translate() : "No".translate()))
        }
        if let type = card.type {
            result.append(.description("Type".translate(), type))
        }
        if let bank = card.bank {
            let bankInformation = ["Name".translate(): bank.name, "City".translate(): bank.city, "Phone".translate(): bank.phone, "URL": bank.url]
                .compactMap { item -> String? in
                    guard let value = item.value else { return nil }
                    return item.key + ": " + value
                }
                .joined(separator: "\n")
            result.append(.description("Bank Information".translate(), bankInformation))
        }
        if let country = card.country {
            if let nameCountry = country.name {
                result.append(.description("Country".translate(), nameCountry + " " + (country.emoji ?? "")))
            }
            if let lat = country.latitude, let lon = country.longitude {
                result.append(.map(lat, lon))
            }
        }
        return result
    }
}
