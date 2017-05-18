//
//  ChangePasswordViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var oldPassword: TextInputView!
    @IBOutlet weak var newPassword: TextInputView!
    @IBOutlet weak var confirmNewPassword: TextInputView!
    @IBOutlet weak var serverResponse: UILabel!

    var changePasswordOperation: ChangePasswordOperation?

    override func viewDidLoad() {
        super.viewDidLoad()

        serverResponse.alpha = 0

        oldPassword.textChecker = PasswordChecker()
        oldPassword.isTextSecure = true
        newPassword.textChecker = PasswordChecker()
        newPassword.isTextSecure = true

        let confirmationTextChecker = PasswordChecker()
        confirmationTextChecker.confirmView = self.newPassword

        confirmNewPassword.textChecker = confirmationTextChecker
        confirmNewPassword.isTextSecure = true

        self.view.backgroundColor = Color.LoginViewController.background

        oldPassword.placeholder = "Stare hasło"
        newPassword.placeholder = "Nowe hasło"
        confirmNewPassword.placeholder = "Powtórz nowe hasło"

        oldPassword.icon = UIImage(named: "passwordIcon.png")
        newPassword.icon = UIImage(named: "passwordIcon.png")
        confirmNewPassword.icon = UIImage(named: "passwordIcon.png")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.reloadInputViews()
    }

    @IBAction func confirmButtonAction(_ sender: Any) {
        if oldPassword.isValid && confirmNewPassword.isValid && oldPassword.text != newPassword.text {
            changePasswordOperation = ChangePasswordOperation(oldPassword: oldPassword.text, newPassword: confirmNewPassword.text)
            changePasswordOperation?.resultCompletion = { result in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.serverResponse.text = success.message
                        self.serverResponse.textColor = Color.LoginTextView.Label.success
                        self.serverResponse.alpha = 1
                        print("Successfully changed password")
                    }
                case .failure(let error):
                    DispatchQueue.main.sync {
                        self.serverResponse.text = "Zmiana hasła nie powiodła się"
                        self.serverResponse.textColor = Color.LoginTextView.Label.error
                        self.serverResponse.alpha = 1
                        print(error)
                    }
                }
            }
        changePasswordOperation?.start()
        } else if oldPassword.text == newPassword.text {
            self.serverResponse.text = "Niepoprawne hasło. Nowe hasło musi różnić się od starego."
            self.serverResponse.textColor = Color.LoginTextView.Label.error
            self.serverResponse.alpha = 1
        }
    }

    @IBAction func signOut(_ sender: Any) {
        BackendAuth.shared.deleteToken()
    }
}
