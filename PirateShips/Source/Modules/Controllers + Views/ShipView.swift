//
//  ShipView.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

final class ShipView: UIView {
    let imageView = UIImageView({
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    })

    let titleLabel = UILabel({
        $0.numberOfLines = 0;
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    })

    let priceLabel = UILabel({
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    })

    let descriptionLabel = UILabel {
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textColor = UIColor.darkGray
    }

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            style: { $0.axis = .vertical; $0.distribution = .fillProportionally; $0.spacing = 8 },
            views: [self.titleLabel, self.priceLabel, self.descriptionLabel])
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = .white
        addSubview(imageView)
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -20),

            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            ])

    }
}
