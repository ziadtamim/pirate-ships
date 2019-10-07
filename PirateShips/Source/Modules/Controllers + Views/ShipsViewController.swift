//
//  ShipsViewController.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

protocol ShipsControllerDelegate: class {
    func didSelect(viewModel: ShipViewModel)
}

final class ShipsViewController: UICollectionViewController {
    weak var delegate: ShipsControllerDelegate?

    fileprivate var viewModels = [ShipViewModel]()

    init(delegate: ShipsControllerDelegate?) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        instantiateInitialState()
        configureCollectionView()
        loadData()
    }

    private func instantiateInitialState() {
        self.title = "Pirate Ships"
    }

    private func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(ShipViewCell.self)
    }

    private func loadData() {
        ShipService.shared.ships { [weak self]
            result in

            if case .failure(let error) = result {
                self?.display(title: "Oh uh.", message: error.localizedDescription)
            } else if case .success(let viewModels) = result {
                self?.viewModels = viewModels
                self?.collectionView.reloadData()
            }
        }
    }

    fileprivate func display(title: String, message: String) {
        Alert.present(from: self, title: title, message: message, dismissButtonTitle: "OK")
    }
}

extension ShipsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShipViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(viewModel: viewModels[indexPath.row])
        return cell
    }
}

extension ShipsViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(viewModel: viewModels[indexPath.row])
    }
}

extension ShipsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
        return CGSize(width: width, height: 80)
    }
}

