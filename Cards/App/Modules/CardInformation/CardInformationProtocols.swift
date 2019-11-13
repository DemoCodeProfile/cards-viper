//
//  CardInformationProtocols.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol CardInformationWireframeProtocol: class {

}
//MARK: Presenter -
protocol CardInformationPresenterProtocol: class {

    var interactor: CardInformationInteractorInputProtocol? { get set }
    
    func receiveCardInformation()
}

//MARK: Interactor -
protocol CardInformationInteractorOutputProtocol: class {
    func receivedCardInformation(_ result: Result<CardNumber, ResponseError>)
}

protocol CardInformationInteractorInputProtocol: class {

    var presenter: CardInformationInteractorOutputProtocol?  { get set }

    func receiveCardInformation(number card: String?)
}

//MARK: View -
protocol CardInformationViewProtocol: class {

    var presenter: CardInformationPresenterProtocol?  { get set }

    func visibleCardList(_ list: [CardInformationData])
    func error(description: String)
    func showLoadingProcess()
}
