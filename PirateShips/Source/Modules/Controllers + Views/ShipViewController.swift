//
//  ShipViewController.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

final class ShipViewController: UIViewController {
    private let viewModel: ShipViewModel

    var containerView: ShipView? {
        return self.view as? ShipView
    }

    init(viewModel: ShipViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = ShipView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItems()
        instantiateInitialState()
    }

    private func configureNavigationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Greeting!!", style: .done, target: self, action: #selector(onGreeting(_:)))
    }

    private func instantiateInitialState() {
        containerView?.titleLabel.text = viewModel.title
        containerView?.priceLabel.text = viewModel.price
        containerView?.descriptionLabel.text = viewModel.description

        containerView?.imageView.setImage(
            from: viewModel.imageURL,
            placeholder: UIImage(named: "placeholder")
        )
    }

}

extension ShipViewController {
    @objc func onGreeting(_ sender: Any) {
        Alert.present(from: self, title: viewModel.greeting, message: "", dismissButtonTitle: "OK")
    }
}
