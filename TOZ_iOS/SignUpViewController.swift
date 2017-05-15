//
//  SignUpViewController.swift
//  TOZ_iOS
//
//  Created by user on 09/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let options = ["Chcę zostać wolontariuszem","Chcę zostać domem tymczasowym"]

    @IBOutlet weak var firstNameInput: TextInputView!
    @IBOutlet weak var surnameInput: TextInputView!
    @IBOutlet weak var emailInput: TextInputView!
    @IBOutlet weak var phoneNumberInput: TextInputView!

    @IBOutlet weak var goalButton: UIButton!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var optionPicker: UIPickerView!

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        optionPicker.dataSource = self
        optionPicker.delegate = self
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

    @IBAction func goalButtonTapped(_ sender: UIButton) {

        optionPicker.isHidden = false

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        goalLabel.isHidden = false
        goalLabel.text = options[row]
        optionPicker.isHidden = true

    }

    func configureView() {
        self.view.backgroundColor = Color.SignUpViewController.background
        firstNameInput.textChecker = NameChecker()
        surnameInput.textChecker = NameChecker()
        emailInput.textChecker = EmailChecker()
        phoneNumberInput.textChecker = PhoneNumberChecker()

        sendButton.backgroundColor = Color.SignUpViewController.Button.background
        sendButton.tintColor = Color.SignUpViewController.Button.tint
        sendButton.layer.cornerRadius = 5

        cancelButton.backgroundColor = Color.SignUpViewController.Button.background
        cancelButton.tintColor = Color.SignUpViewController.Button.tint
        cancelButton.layer.cornerRadius = 5

        goalButton.backgroundColor = Color.SignUpViewController.Button.background
        goalButton.tintColor = Color.SignUpViewController.Button.tint
        goalButton.layer.cornerRadius = 5

        optionPicker.backgroundColor = Color.SignUpViewController.background
        optionPicker.tintColor = UIColor.white

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
