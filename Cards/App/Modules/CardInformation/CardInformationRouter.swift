//
//  CardInformationRouter.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

class CardInformationRouter: CardInformationWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(number card: String?) -> UIViewController {
        let cardApiClient = DependencyInjection.instance.container.resolve(APIClient.self, name: "CardAPIClient")
        let view = CardInformationViewController(nibName: nil, bundle: nil)
        let interactor = CardInformationInteractor(apiClient: cardApiClient)
        let router = CardInformationRouter()
        let presenter = CardInformationPresenter(interface: view, interactor: interactor, router: router, cardNumber: card)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
