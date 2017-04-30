//
//  TextInputView.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//
import UIKit

enum CheckResult {
    case Valid
    case Invalid(error: String)

    func isValid() -> Bool {
        switch self {
        case .Valid: return true
        default: return false
        }
    }

}

protocol TextChecker {
    func check(text: String) -> CheckResult
}

fileprivate struct TextInputViewDimensions {
    static let margin: CGFloat = 0
    static let offset: CGFloat = 4
    static let textFieldHeight: CGFloat = 24
    static let labelHeight: CGFloat = 16
}

class TextInputView: UIView, UITextFieldDelegate {
    private let textField = UITextField()
    private let label = UILabel()
    var textChecker: TextChecker?

    var text: String {
        return self.textField.text ?? ""
    }

    var isValid: Bool {
        return textChecker?.check(text: text).isValid() ?? false
    }

    var placeholder: String = "" {
        didSet {
            self.textField.placeholder = placeholder
        }
    }

    var attributedPlaceholder: NSAttributedString? {
        didSet {
            self.textField.attributedPlaceholder = attributedPlaceholder
        }
    }

    var isTextSecure: Bool = false {
        didSet {
            self.textField.isSecureTextEntry = isTextSecure
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
        self.textField.addTarget(self, action: #selector(textFieldDidEndEditing), for: UIControlEvents.editingDidEnd)
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

        setupConstraints()
    }

    private func setupConstraints() {
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: TextInputViewDimensions.margin).isActive = true
        self.textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -TextInputViewDimensions.margin).isActive = true
        self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: TextInputViewDimensions.offset).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: TextInputViewDimensions.textFieldHeight).isActive = true

        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: TextInputViewDimensions.margin).isActive = true
        self.label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -TextInputViewDimensions.margin).isActive = true
        self.label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: TextInputViewDimensions.offset).isActive = true
        self.label.heightAnchor.constraint(equalToConstant: TextInputViewDimensions.labelHeight).isActive = true
    }

    private func checkText() {
        if let textChecker = self.textChecker {
            switch textChecker.check(text: self.text) {
                case .Valid:
                    successLayout()
                case .Invalid(error: let errorString):
                    errorLayout()
                    self.label.text = errorString

            }

        }
    }

    private func successLayout() {
        self.textField.layer.shadowColor = Color.LoginTextView.TextField.BorderShadow.success
        self.label.alpha = 0
    }

    private func errorLayout() {
        self.textField.layer.shadowColor = Color.LoginTextView.TextField.BorderShadow.error
        self.label.alpha = 1
    }

    func textFieldDidEndEditing() {
        self.label.text = errorString
        checkText()
    }

}
