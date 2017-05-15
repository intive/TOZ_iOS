//
//  SignUpViewController.swift
//  TOZ_iOS
//
//  Created by user on 15/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    let options = ["Chcę zostać wolontariuszem", "Chcę zostać domem tymczasowym"]

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
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToLoginView", sender: self)
    }

    func configureView() {
        self.view.backgroundColor = Color.SignUpViewController.background
        firstNameInput.textChecker = NameChecker()
        surnameInput.textChecker = NameChecker()
        emailInput.textChecker = EmailChecker()
        phoneNumberInput.textChecker = PhoneNumberChecker()

        goalSegmentedControl.backgroundColor = Color.SignUpViewController.SegmentedControl.background
        goalSegmentedControl.tintColor = Color.SignUpViewController.SegmentedControl.tint

        goalSegmentedControl.layer.cornerRadius = 5

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
