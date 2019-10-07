//
//  ShipViewCell.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

final class ShipViewCell: UICollectionViewCell {
    fileprivate let imageView = UIImageView({
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    })

    fileprivate let titleLabel = UILabel {
        $0.numberOfLines = 2;
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    fileprivate let priceLabel = UILabel {
        $0.font = UIFont.systemFont(ofSize: 15)
    }

    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            style: { $0.axis = .vertical; $0.distribution = .fill; $0.spacing = 4 },
            views: [self.titleLabel, self.priceLabel])
        return stackView
    }()

    func configure(viewModel: ShipViewModel) {
        imageView.setImage(
            from: viewModel.imageURL,
            placeholder: UIImage(named: "placeholder")
        )
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        addSubview(imageView)
        addSubview(stackView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: imageView.topAnchor)
            ])
    }
}
