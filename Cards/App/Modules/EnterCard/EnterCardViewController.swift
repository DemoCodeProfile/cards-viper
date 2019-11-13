//
//  EnterCardViewController.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

final class EnterCardViewController: UIViewController, EnterCardViewProtocol {
    
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var cardNumberStatusIcon: UIImageView!
    @IBOutlet weak var cardInformationButton: UIButton!
    @IBOutlet weak var checkCardButton: UIButton!
    
    var presenter: EnterCardPresenterProtocol?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Card number".translate()
    }
    
    @IBAction func cardNumberChanged(_ sender: UITextField) {
        presenter?.enter(number: sender.text)
    }
    
    @IBAction func checkCard(_ sender: UIButton) {
        presenter?.check(number: cardNumberTextField.text)
        cardNumberTextField.resignFirstResponder()
    }
    
    @IBAction func showCardInformationScreen(_ sender: UIButton) {
        presenter?.showCardInformationScreen()
    }
    
    func cardNumber(isValid: Bool) {
        cardNumberStatusIcon.isHidden = false
        cardNumberStatusIcon.image = isValid ? UIImage(named: "valid") : UIImage(named: "invalide")
        informationButton(isHidden: !isValid)
    }
    
    func cardNumberIcon(isHidden: Bool) {
        cardNumberStatusIcon.isHidden = isHidden
    }
    
    func informationButton(isHidden: Bool) {
        cardInformationButton.isHidden = isHidden
        checkCardButton.isHidden = !isHidden
    }
    
    func paySystem(_ name: String) {
        cardNumberLabel.text = !name.isEmpty ? String(format: "Card number (%@)".translate(), name) : "Card number".translate()
    }
}
