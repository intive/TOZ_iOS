//
//  ApplicationFormViewController.swift
//  TOZ_iOS
//
//  Created by patronage on 04.05.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class ApplicationFormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var surnameErrorLabel: UILabel!
    @IBOutlet weak var phoneNumberErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var formSuccessLabel: UILabel!
    
    var errorHandler: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func isEmailCorrect(email: String) -> Bool {
        var amountOfMonkeySigns = 0
        var amountOfDotSigns = 0
        var monkeyPlace = -1
        var setOfDots = Set<Int>()
        var counter = 0
        if CharacterSet.decimalDigits.contains(email.unicodeScalars.first!) || email.characters.first == "_" || email.characters.first == "." || email.characters.first == "-" {
            return false
        }
        for char in email.characters {
            counter += 1
            if !CharacterSet.letters.contains(String(char).unicodeScalars.first!) &&
            char != "_" && char != "-" && char != "." {
                return false
            }
            if char == "@" {
                monkeyPlace = counter
                amountOfMonkeySigns += 1
                if amountOfMonkeySigns > 1 {
                    return false
                }
            } else if char == "." {
                amountOfDotSigns += 1
                setOfDots.insert(counter)
            }
        }
        for dot in setOfDots {
            if monkeyPlace > dot {
                return false
            }
        }
        if setOfDots.count == 0 {
            return false
        }
        if amountOfMonkeySigns == 0 {
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func isFormCorect(_ sender: Any) {
        if nameTextField.text?.characters.count == 0 {
            nameErrorLabel.text = "Pole wymagane"
            errorHandler = true
        } else if nameTextField.text!.characters.count > 35 {
            nameErrorLabel.text = "Niepoprawne dane"
            errorHandler = true
        }
        if surnameTextField.isEqual("") {
            surnameErrorLabel.text = "Pole wymagane"
            errorHandler = true
        } else if surnameTextField.text!.characters.count > 35 {
            surnameErrorLabel.text = "Niepoprawne dane"
            errorHandler = true
        }
        if phoneNumberTextField.text?.characters.count == 0 {
            phoneNumberErrorLabel.text = "Pole wymagane"
            errorHandler = true
        } else if phoneNumberTextField.text!.characters.count != 9 &&
            phoneNumberTextField.text!.characters.count != 11 {
            phoneNumberErrorLabel.text = "Niepoprawne dane"
            errorHandler = true
        }
        if emailTextField.text?.characters.count == 0 {
            emailErrorLabel.text = "Pole wymagane"
            errorHandler = true
        } else if emailTextField.text!.characters.count > 255 {
            emailErrorLabel.text = "Niepoprawne dane"
            errorHandler = true
        } else if !isEmailCorrect(email: emailTextField.text!) {
            emailErrorLabel.text = "Niepoprawne dane"
            errorHandler = true
        }
        if errorHandler == false {
            formSuccessLabel.text = "Formularz został wysłany do organizacji"
        }
    }
}
