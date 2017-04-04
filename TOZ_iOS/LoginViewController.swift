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
        sessionIsOutdated()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginErrorText.isUserInteractionEnabled = false
        self.passwordErrorText.isUserInteractionEnabled = false
        self.view.backgroundColor = Color.Background.primary
        self.loginIncorrectImage.alpha = 0
        self.passwordIncorrectImage.alpha = 0
        self.logoImageView.image = UIImage(named: "pug_logo")
        self.companyNameLabel.text = "Towarzystwo Opieki nad Zwierzętami"
    }

    func incorrectPassword() {
        self.passwordTextField.text = ""
        self.passwordErrorText.text = "Wpisane hasło jest niepoprawne"
        self.passwordTextField.layer.borderWidth = 2.0
        self.passwordTextField.layer.borderColor = UIColor.red.cgColor
        self.passwordIncorrectImage.image = UIImage(named: "redTriangle")
        self.passwordIncorrectImage.alpha = 0.7
        errorColorChange()
    }

    func incorrectLogin() {
        self.loginTextField.text = ""
        self.loginErrorText.text = "Wpisany login jest niepoprawny"
        self.loginTextField.layer.borderWidth = 2.0
        self.loginTextField.layer.borderColor = UIColor.red.cgColor
        self.loginIncorrectImage.image = UIImage(named: "redTriangle")
        self.loginIncorrectImage.alpha = 0.7
        errorColorChange()
    }

    func errorColorChange() {
        self.loginErrorText.backgroundColor = .white
        self.passwordErrorText.backgroundColor = .white
        self.loginErrorText.alpha = 0.8
        self.passwordErrorText.alpha = 0.8
    }

    func sessionIsOutdated() {
        let alertView = UIAlertController(title: "Błąd", message: "Link aktywacyjny wygasł, skontaktuj się z administratorem", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Rozumiem", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
}
