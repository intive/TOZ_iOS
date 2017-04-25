//
//  ResetPasswordViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var oldPassword: TextInputView!
    @IBOutlet weak var newPassword: TextInputView!
    @IBOutlet weak var confirmNewPassword: TextInputView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.oldPassword.textChecker = PasswordChecker()
        self.newPassword.textChecker = PasswordChecker()
        self.confirmNewPassword.textChecker = PasswordChecker()
        self.oldPassword.errorString = "AAAAaaaaaaAAaa"
        self.newPassword.errorString = "AAAAaaaaaaAAaa"
        self.confirmNewPassword.errorString = "AAAAaaaaaaAAaa"

        self.view.backgroundColor = Color.Background.primary
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.reloadInputViews()
    }

    @IBAction func confirmButtonAction(_ sender: Any) {
        guard oldPassword.isValid, newPassword.isValid, confirmNewPassword.isValid == true else {
            //configure for error
            return
        }
    }

    private func isPasswordValid() -> Bool {
        //to be continued when possible
        //send request to BE for confirmation
        return false
    }

}
