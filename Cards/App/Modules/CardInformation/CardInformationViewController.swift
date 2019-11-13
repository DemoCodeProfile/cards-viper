//
//  CardInformationViewController.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import UIKit

final class CardInformationViewController: UIViewController, CardInformationViewProtocol {
    struct Constants {
        static let identityKeyValue = "DescriptionCell"
        static let identityMap = "MapCell"
    }
    
	var presenter: CardInformationPresenterProtocol?
    var datas: [CardInformationData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var plugView: UIView!
    
    @IBAction func tryAgain(_ sender: UIButton) {
        presenter?.receiveCardInformation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Information about card".translate()
    }

    private func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(
            UINib(nibName: "DescriptionCell", bundle: nil),
            forCellReuseIdentifier: Constants.identityKeyValue
        )
        tableView.register(
            UINib(nibName: "MapCell", bundle: nil),
            forCellReuseIdentifier: Constants.identityMap
        )
        presenter?.receiveCardInformation()
    }
    
    func visibleCardList(_ list: [CardInformationData]) {
        datas = list
        plugView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func error(description: String) {
        errorLabel.text = description
        plugView.isHidden = false
    }
    
    func showLoadingProcess() {
        activityIndicator.startAnimating()
        plugView.isHidden = true
    }
}

extension CardInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch datas[indexPath.row] {
        case .description(let title, let description):
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identityKeyValue, for: indexPath) as? DescriptionCell
            cell?.titleLabel.text = title
            cell?.descriptionLabel.text = description
            return cell ?? UITableViewCell()
        case .map(let lat, let lon):
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identityMap, for: indexPath) as? MapCell
            cell?.setCoordinates(lat: lat, lon: lon)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight(index: indexPath.row)
    }
    
    private func rowHeight(index: Int) -> CGFloat {
        switch datas[index] {
        case .description:
            return UITableView.automaticDimension
        case .map:
            return 300
        }
    }
}
