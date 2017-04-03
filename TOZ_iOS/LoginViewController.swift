//
//  LoginViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var loginErrorText: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorText: UITextField!
    @IBOutlet weak var loginIncorrectImage: UIImageView!
    @IBOutlet weak var passwordIncorrectImage: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!

    @IBAction func loginButtonAction(_ sender: Any) {
        incorrectPassword()
        incorrectLogin()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginErrorText.isUserInteractionEnabled = false
        self.passwordErrorText.isUserInteractionEnabled = false
        self.loginIncorrectImage.alpha = 0
        self.passwordIncorrectImage.alpha = 0
        self.logoImageView.image = UIImage(named: "tozTempLogo")
        self.companyNameLabel.text = "Towarzystwo Opieki nad Zwierzętami"
    }

    func incorrectPassword() {
        self.passwordTextField.text = ""
        self.passwordErrorText.placeholder = "Wpisane hasło jest niepoprawne"
        self.passwordErrorText.attributedPlaceholder = NSAttributedString(string: passwordErrorText.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.red])
        self.passwordTextField.layer.borderWidth = 2.0
        self.passwordTextField.layer.borderColor = UIColor.red.cgColor
        self.passwordIncorrectImage.image = UIImage(named: "redTriangle")
        self.passwordIncorrectImage.alpha = 1
    }

    func incorrectLogin() {
        self.loginTextField.text = ""
        self.loginErrorText.placeholder = "Wpisany login jest niepoprawny"
        self.loginErrorText.attributedPlaceholder = NSAttributedString(string: loginErrorText.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.red])
        self.loginTextField.layer.borderWidth = 2.0
        self.loginTextField.layer.borderColor = UIColor.red.cgColor
        self.loginIncorrectImage.image = UIImage(named: "redTriangle")
        self.loginIncorrectImage.alpha = 1
    }
}
