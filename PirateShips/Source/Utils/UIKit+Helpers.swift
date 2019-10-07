//
//  UIKit+Helpers.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(_ style: ((UILabel) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

extension UIImageView {
    convenience init(_ style: ((UIImageView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

extension UIActivityIndicatorView {
    convenience init(style: ((UIActivityIndicatorView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}
extension UIStackView {
    @nonobjc convenience init(style: ((UIStackView) -> Void)..., views: [UIView]) {
        self.init(arrangedSubviews: views)
        style.forEach { $0(self) }
    }
}
