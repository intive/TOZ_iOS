//
//  LoginViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailInput: TextInputView!
    @IBOutlet weak var passwordInput: TextInputView!
    @IBOutlet weak var errorLabel: UILabel!

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
                    if let token = BackendAuth.shared.token {
                        print("Token >\(token)< successfully set for email \(self.emailInput.text)")
                    }
                    _ = self.navigationController?.popToRootViewController(animated: true)
                }
            case .failure(let error):
                DispatchQueue.main.sync {
                    print(error)
                    self.errorLabel.alpha = 1
                    self.errorLabel.textColor = Color.LoginTextView.Label.error
                    self.errorLabel.text = "Błąd logowania: spróbuj ponownie później"
                }
            }
        }
        if self.emailInput.isValid && self.passwordInput.isValid {
            signInOperation?.start()
        }
    }

    func configureView() {
        self.view.backgroundColor = Color.LoginViewController.background

        emailInput.textChecker = EmailChecker()
        emailInput.placeholder = "Login"
        emailInput.icon = UIImage(named: "loginIcon.png")

        passwordInput.textChecker = TextLengthChecker(charactersLimit: 35)
        passwordInput.placeholder = "Hasło"
        passwordInput.icon = UIImage(named: "passwordIcon.png")
        passwordInput.isTextSecure = true

        errorLabel.alpha = 0
    }
}
