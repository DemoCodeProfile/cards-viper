//
//  EnterCardRouter.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

final class EnterCardRouter: EnterCardWireframeProtocol {
    
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = EnterCardViewController(nibName: nil, bundle: nil)
        let interactor = EnterCardInteractor()
        let router = EnterCardRouter()
        let presenter = EnterCardPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func showCardInformationScreen(number card: String?) {
        let cardInformationViewController = CardInformationRouter.createModule(number: card)
        viewController?.navigationController?.pushViewController(cardInformationViewController, animated: true)
//        viewController?.present(cardInformationViewController, animated: true, completion: nil)
    }
}
