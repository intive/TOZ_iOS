//
//  SignUpViewController.swift
//  TOZ_iOS
//
//  Created by user on 09/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameInput: TextInputView!
    @IBOutlet weak var surnameInput: TextInputView!
    @IBOutlet weak var emailInput: TextInputView!
    @IBOutlet weak var phoneNumberInput: TextInputView!

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToLoginView", sender: self)
    }

    func configureView() {
        self.view.backgroundColor = Color.LoginViewController.background
        firstNameInput.textChecker = NameChecker()
        surnameInput.textChecker = NameChecker()
        emailInput.textChecker = EmailChecker()
        phoneNumberInput.textChecker = PhoneNumberChecker()

        sendButton.backgroundColor = Color.LoginViewController.Button.background
        sendButton.tintColor = Color.LoginViewController.Button.tint
        sendButton.layer.cornerRadius = 5

        cancelButton.backgroundColor = Color.LoginViewController.Button.background
        cancelButton.tintColor = Color.LoginViewController.Button.tint
        cancelButton.layer.cornerRadius = 5

        firstNameInput.placeholder = " Imię..."
        surnameInput.placeholder = " Nazwisko..."
        emailInput.placeholder = " E-mail..."
        phoneNumberInput.placeholder = " Numer telefonu..."
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
