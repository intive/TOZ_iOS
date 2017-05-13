//
//  Button.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Button: UIButton {

    @IBInspectable var width: CGFloat = 354
    @IBInspectable var height: CGFloat = 50

    override var intrinsicContentSize: CGSize {
        return CGSize(width: width, height: height)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    func configure() {
        self.backgroundColor = Color.LoginViewController.Button.background
        self.tintColor = Color.LoginViewController.Button.tint
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.layer.cornerRadius = 5
    }

}
