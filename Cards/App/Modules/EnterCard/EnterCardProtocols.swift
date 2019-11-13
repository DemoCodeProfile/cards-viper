//
//  EnterCardProtocols.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol EnterCardWireframeProtocol: class {
    func showCardInformationScreen(number card: String?)
}
//MARK: Presenter -
protocol EnterCardPresenterProtocol: class {

    var interactor: EnterCardInteractorInputProtocol? { get set }
    
    func enter(number card: String?)
    func check(number card: String?)
    func showCardInformationScreen()
}

//MARK: Interactor -
protocol EnterCardInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol EnterCardInteractorInputProtocol: class {

    var presenter: EnterCardInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol EnterCardViewProtocol: class {

    var presenter: EnterCardPresenterProtocol?  { get set }

    func cardNumber(isValid: Bool)
    func cardNumberIcon(isHidden: Bool)
    func informationButton(isHidden: Bool)
    func paySystem(_ name: String)
}
