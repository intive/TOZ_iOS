//
//  LoginTextfieldViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailInput: TextInputView!
    @IBOutlet weak var passwordInput: TextInputView!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        self.view.backgroundColor = Color.LoginViewController.background
        emailInput.textChecker = NameChecker()
        emailInput.attributedPlaceholder = addIconToString(icon: #imageLiteral(resourceName: "loginIcon"), string: "   Login")
        emailInput.errorString = "Wpisz prawidłową nazwę użytkownika"

        passwordInput.attributedPlaceholder = addIconToString(icon: #imageLiteral(resourceName: "passwordIcon"), string: "   Hasło")

        loginButton.backgroundColor = Color.LoginViewController.Button.background
        loginButton.tintColor = Color.LoginViewController.Button.tint
        loginButton.layer.cornerRadius = 5
    }

    func addIconToString(icon: UIImage, string: String) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = icon
        attachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)
        let attachmentStr = NSAttributedString(attachment: attachment)
        let iconString = NSMutableAttributedString(string: "  ")
        iconString.append(attachmentStr)
        let placeholderString = NSMutableAttributedString(string: string)
        iconString.append(placeholderString)
        return iconString
    }
}
