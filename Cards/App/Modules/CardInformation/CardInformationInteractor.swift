//
//  CardInformationInteractor.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

class CardInformationInteractor: CardInformationInteractorInputProtocol {
    
    weak var presenter: CardInformationInteractorOutputProtocol?
    var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func receiveCardInformation(number card: String?) {
        let cardAPIRequest = CardAPIRequest(resourceName: card ?? "")
        apiClient.send(cardAPIRequest) { [weak self] result in
            guard let `self` = self else { return }
            self.presenter?.receivedCardInformation(result)
        }
    }
}
