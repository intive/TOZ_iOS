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
        let passwordFields = [oldPassword, newPassword, confirmNewPassword]
        for textField in passwordFields {
            textField?.textChecker = PasswordChecker()
            textField?.isTextSecure = true
            textField?.errorString = "Dicks"
        }

//        self.oldPassword.textChecker = PasswordChecker()
//        self.newPassword.textChecker = PasswordChecker()
//        self.confirmNewPassword.textChecker = PasswordChecker()
//        self.oldPassword.isTextSecure = true
//        self.newPassword.isTextSecure = true
//        self.confirmNewPassword.isTextSecure = true
        self.view.backgroundColor = Color.Background.primary
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.reloadInputViews()
    }

    @IBAction func confirmButtonAction(_ sender: Any) {

//    private func isPasswordValid() -> Bool {
//        //to be continued when possible
//        //send request to BE for confirmation
//        return false
    }

    func isPasswwordValid() -> Bool {
        var isValid: Bool = false
        if oldPassword.isValid, newPassword.isValid, confirmNewPassword.isValid == false {
        //check if oldPassword matches real password
        } else if confirmNewPassword.text != newPassword.text {
            //error
        } else if newPassword.text == oldPassword.text {
            //error
        } else {
            isValid = true
        }
        return isValid
    }

}
