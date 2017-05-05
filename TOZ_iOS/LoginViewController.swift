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
        emailInput.attributedPlaceholder = addIconToString(icon: #imageLiteral(resourceName: "loginIcon"), string: "   Login")
        emailInput.errorString = "Wpisz prawidłową nazwę użytkownika"

        passwordInput.attributedPlaceholder = addIconToString(icon: #imageLiteral(resourceName: "passwordIcon"), string: "   Hasło")

        loginButton.backgroundColor = Color.LoginViewController.Button.background
        loginButton.tintColor = Color.LoginViewController.Button.tint
        loginButton.layer.cornerRadius = 5
//        loginButton.addTarget(self, action: handleSignIn(), for: .touchUpInside)
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
