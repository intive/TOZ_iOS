//
//  SignUpViewController.swift
//  TOZ_iOS
//
//  Created by user on 15/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameInput: TextInputView!
    @IBOutlet weak var surnameInput: TextInputView!
    @IBOutlet weak var emailInput: TextInputView!
    @IBOutlet weak var phoneNumberInput: TextInputView!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!

    var role: [Role] = [Role.VOLUNTEER]
    var signUpOperation: SignUpOperation?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    @IBAction func signUpAction(_ sender: Any) {
        signUp()
    }

    func changeRole() {
        switch goalSegmentedControl.selectedSegmentIndex {
        case 0: self.role = [Role.VOLUNTEER]
        case 1: self.role = [Role.TOZ]
        default: break
        }
    }

    func configureView() {
        goalSegmentedControl.addTarget(self, action: #selector(changeRole), for: .valueChanged)
        self.view.backgroundColor = Color.SignUpViewController.background
        firstNameInput.textChecker = NameChecker()
        surnameInput.textChecker = NameChecker()
        emailInput.textChecker = EmailChecker()
        phoneNumberInput.textChecker = PhoneNumberChecker()

        goalSegmentedControl.backgroundColor = Color.SignUpViewController.SegmentedControl.background
        goalSegmentedControl.tintColor = Color.SignUpViewController.SegmentedControl.tint
        goalSegmentedControl.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 11)], for: .normal)
        goalSegmentedControl.layer.cornerRadius = 5

        firstNameInput.placeholder = " Imię"
        surnameInput.placeholder = " Nazwisko"
        emailInput.placeholder = " E-mail"
        phoneNumberInput.placeholder = " Numer telefonu"
        self.addHideKeyboardGestureRecognizer()
    }

    func signUp() {
        if firstNameInput.isValid, surnameInput.isValid, emailInput.isValid, phoneNumberInput.isValid {
            self.signUpOperation = SignUpOperation(name: self.firstNameInput.text, surname: self.surnameInput.text, phoneNumber: self.phoneNumberInput.text, email: self.emailInput.text, roles: role)
            if let signUpOperation = self.signUpOperation {
                SVProgressHUD.show()
                signUpOperation.start { succes in
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                        if succes == false {
                            let alert = UIAlertController(title: "Ups", message: "Wystąpił błąd, spróbuj ponownie później.", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        } else {
                            let alert = UIAlertController(title: "Sukces", message: "Zgłoszenie zostało wysłane", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }
    
}
