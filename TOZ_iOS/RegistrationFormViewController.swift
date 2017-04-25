//
//  RegistrationFormViewController.swift
//  TOZ_iOS
//
//  Created by user on 25/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class RegistrationFormViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userSurnameTextField: UITextField!
    @IBOutlet weak var userPhoneNumberTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendButtonTapped(_ sender: UIButton) {

        func emptyCheck (optionalText: String?) -> Bool {
            if optionalText != nil {
                return false
            } else {
                return true
            }
        }

        let userName = userNameTextField.text
        let userSurname = userSurnameTextField.text
        let userPhoneNumber = userPhoneNumberTextField.text
        let userEmail = userEmailTextField.text

        if emptyCheck(optionalText: userName) || emptyCheck(optionalText: userSurname) || emptyCheck(optionalText: userPhoneNumber) || emptyCheck(optionalText: userEmail) {

            //display alert message

            displayAlertMessage(userMessage: "All fields are required")
        }

        //check for empty fields

        //store data

        //display alert message with confirmation
    }

    func displayAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)

        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)

        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
}
