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
        emailInput.textChecker = EmailChecker()
        emailInput.errorString = "Wpisz prawidłową nazwę użytkownika"
        emailInput.placeholder = "Login"
        emailInput.icon = UIImage(named: "loginIcon.png")

        passwordInput.placeholder = "Hasło"
        passwordInput.icon = UIImage(named: "passwordIcon.png")

        loginButton.backgroundColor = Color.LoginViewController.Button.background
        loginButton.tintColor = Color.LoginViewController.Button.tint
        loginButton.layer.cornerRadius = 5
    }
}
