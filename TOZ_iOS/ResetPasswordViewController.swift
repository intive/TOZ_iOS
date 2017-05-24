//
//  ResetPasswordViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    @IBOutlet weak var emailInput: TextInputView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.Background.primary
        self.emailInput.placeholder = "E-Mail"
        self.emailInput.textChecker = EmailChecker()
        self.indicatorView.activityIndicatorViewStyle = .whiteLarge
        self.indicatorView.color = Color.Cell.Button.primary
        self.indicatorView.hidesWhenStopped = true
    }

    @IBAction func confirmReset(_ sender: Any) {
        if emailInput.isValid {
            let resetPassword = ResetPasswordOperation(email: self.emailInput.text)
            self.indicatorView.startAnimating()
            resetPassword.start { success in
                DispatchQueue.main.async {
                    self.indicatorView.stopAnimating()
                    if success == false {
                        let alert = UIAlertController(title: "Ups", message: "Wystąpił błąd, spróbuj ponownie później.", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        let alert = UIAlertController(title: "Udało się!", message: "Sprawdź swoją skrzynkę e-mail w celu zakończenia procedury resetowania hasła", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)

                    }
                }
            }
        }
    }

}
