//
//  SignUpViewController.swift
//  TOZ_iOS
//
//  Created by user on 15/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameInput: TextInputView!
    @IBOutlet weak var surnameInput: TextInputView!
    @IBOutlet weak var emailInput: TextInputView!
    @IBOutlet weak var phoneNumberInput: TextInputView!

    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func configureView() {
        self.view.backgroundColor = Color.SignUpViewController.background
        firstNameInput.textChecker = NameChecker()
        surnameInput.textChecker = NameChecker()
        emailInput.textChecker = EmailChecker()
        phoneNumberInput.textChecker = PhoneNumberChecker()

        goalSegmentedControl.backgroundColor = Color.SignUpViewController.SegmentedControl.background
        goalSegmentedControl.tintColor = Color.SignUpViewController.SegmentedControl.tint
        let font = UIFont.systemFont(ofSize: 10)
        goalSegmentedControl.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)

        goalSegmentedControl.layer.cornerRadius = 5

        firstNameInput.placeholder = " Imię..."
        surnameInput.placeholder = " Nazwisko..."
        emailInput.placeholder = " E-mail..."
        phoneNumberInput.placeholder = " Numer telefonu..."
    }
}
