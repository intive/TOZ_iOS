//
//  LoginViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var incorrectLoginLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var incorrectPasswordLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!

    @IBAction func loginButtonAction(_ sender: Any) {
        incorrectPassword()
        incorrectLogin()
        sessionIsOutdated()

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.dismiss(animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func incorrectPassword() {
        self.passwordTextField.text = ""
        self.incorrectPasswordLabel.text = "Wpisane hasło jest niepoprawne"
        self.incorrectPasswordLabel.alpha = 0.8
        self.incorrectPasswordLabel.backgroundColor = .white
        self.passwordTextField.layer.borderColor = UIColor.red.cgColor
    }

    func incorrectLogin() {
        self.loginTextField.text = ""
        self.incorrectLoginLabel.text = "Wpisany login jest niepoprawny"
        self.incorrectLoginLabel.alpha = 0.8
        self.incorrectLoginLabel.backgroundColor = .white
        self.loginTextField.layer.borderColor = UIColor.red.cgColor
    }

    func sessionIsOutdated() {
        let alertView = UIAlertController(title: "Błąd", message: "Link aktywacyjny wygasł, skontaktuj się z administratorem", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Rozumiem", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }

    private func configureView() {
        self.view.backgroundColor = Color.Background.primary
        self.incorrectLoginLabel.alpha = 0
        self.loginView.alpha = 0.8

        self.incorrectPasswordLabel.alpha = 0
        self.passwordView.alpha = 0.8

        self.logoImageView.image = UIImage(named: "pug_logo")
        self.companyNameLabel.text = "Towarzystwo Opieki nad Zwierzętami"

        self.loginTextField.layer.cornerRadius = 20
        self.loginTextField.layer.borderWidth = 2
        self.passwordTextField.layer.cornerRadius = 20
        self.passwordTextField.layer.borderWidth = 2
    }

}
