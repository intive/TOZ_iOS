//
//  TextInputView.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//
import UIKit

protocol TextChecker {
    func check(text: String) -> Bool
}

fileprivate struct TextInputViewDimensions {
    static let margin: CGFloat = 5
    static let offset: CGFloat = 8
}

enum Type: String {
    case name = "Imię"
    case surname = "Nazwisko"
    case password = "Hasło"
    case phoneNumber = "Numer Telefonu"
    case other = "inne"
}

class TextInputView: UIView, UITextFieldDelegate {
    private let textField = UITextField()
    private let label = UILabel()

    var type: Type = .other {
        didSet {
            let typeString = self.type.rawValue
            switch self.type {
            case .name:
                self.textField.placeholder = typeString
                self.textChecker = CheckName()
            case .surname:
                textField.placeholder = typeString
                self.textChecker = CheckSurname()
            case .password:
                textField.placeholder = typeString
                self.textField.isSecureTextEntry = true
                self.textChecker = CheckName()
            case .phoneNumber:
                self.textField.placeholder = typeString
                self.textField.keyboardType = .numbersAndPunctuation
                self.textChecker = CheckPhoneNumber()
            default: break
            }
        }
    }

    var textChecker: TextChecker?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    private func configureView() {
        self.textField.delegate = self
        self.textField.addTarget(self, action: #selector(textFieldDidEndEditing), for: UIControlEvents.editingDidEndOnExit)

        self.addSubview(textField)
        self.addSubview(label)

        self.textField.layer.shadowColor = UIColor.lightGray.cgColor
        self.textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        self.textField.layer.shadowOpacity = 1.0
        self.textField.backgroundColor = .white
        self.textField.layer.cornerRadius = 5
        self.layer.cornerRadius = 5

        let textFieldLeft: NSLayoutConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: TextInputViewDimensions.margin)
        let textFieldRight: NSLayoutConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -TextInputViewDimensions.margin)
        let textFieldTop: NSLayoutConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: TextInputViewDimensions.margin)
        self.textField.translatesAutoresizingMaskIntoConstraints = false

        let labelLeft: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: TextInputViewDimensions.margin)
        let labelRight: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -TextInputViewDimensions.margin)
        let labelTop: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: textField, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: TextInputViewDimensions.offset)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([textFieldLeft, textFieldRight, textFieldTop, labelLeft, labelRight, labelTop])
    }

    func checkText() {
        let text = self.textField.text ?? ""
        if let textChecker = self.textChecker {
            if textChecker.check(text: text) {
                successLayout()
            } else {
                errorLayout()
            }
        }
    }

    private func successLayout() {
        self.textField.layer.shadowColor = UIColor.green.cgColor

    }

    private func errorLayout() {
        self.textField.layer.shadowColor = UIColor.red.cgColor

    }

    func textFieldDidEndEditing() {
        checkText()
        textField.resignFirstResponder()
    }

}
