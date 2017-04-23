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

class TextInputView: UIView, UITextFieldDelegate {
    private let textField = UITextField()
    private let label = UILabel()
    var textChecker: TextChecker?

    var text: String {
        return self.textField.text ?? ""
    }

    var isValid: Bool {
        return textChecker?.check(text: text) ?? false
    }

    var placeholder: String = "" {
        didSet {
            self.textField.placeholder = placeholder
        }
    }

    var errorString: String?

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

        self.label.textColor = Color.LoginTextView.Label.error
        self.label.alpha = 0
        self.label.adjustsFontSizeToFitWidth = true

        self.textField.layer.shadowColor = Color.LoginTextView.TextField.BorderShadow.passive
        self.textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        self.textField.layer.shadowOpacity = 1.0
        self.textField.backgroundColor = Color.LoginTextView.TextField.background
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
        let text = self.text
        if let textChecker = self.textChecker {
            if textChecker.check(text: text) {
                successLayout()
            } else {
                errorLayout()
            }
        }
    }

    private func successLayout() {
        self.textField.layer.shadowColor = Color.LoginTextView.TextField.BorderShadow.success
        self.label.alpha = 0
    }

    private func errorLayout() {
        self.label.text = errorString
        self.textField.layer.shadowColor = Color.LoginTextView.TextField.BorderShadow.error
        self.label.alpha = 1
    }

    func textFieldDidEndEditing() {
        checkText()
    }

}
