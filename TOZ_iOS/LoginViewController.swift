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

    var signInOperation: SignInOperation?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    @IBAction func handleSignIn(_ sender: Any) {
        signInOperation = SignInOperation(email: emailInput.text, password: passwordInput.text)
        signInOperation?.resultCompletion = { result in
            switch result {
            case .success(let successfullSignIn):
                DispatchQueue.main.async {
                    BackendAuth.shared.setToken(successfullSignIn.jwt)
                    print("Token \(BackendAuth.shared.token ?? "was not") successfully set for email \(self.emailInput.text)")
                    BackendAuth.shared.deleteToken()
                }
            case .failure(let error):
                print(error)
            }
        }
        signInOperation?.start()
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
//        loginButton.addTarget(self, action: handleSignIn(), for: .touchUpInside)
    }
}
