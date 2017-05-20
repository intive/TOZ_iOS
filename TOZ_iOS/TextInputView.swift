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
    static let labelHeight: CGFloat = 14
}

@IBDesignable
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

    var icon: UIImage? {
        didSet {
            addIconToTextField()
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
        self.textField.addTarget(self, action: #selector(textFieldIsEditing), for: UIControlEvents.editingDidBegin)

        self.addSubview(textField)
        self.addSubview(label)

        self.label.textColor = Color.LoginTextView.Label.error
        self.label.alpha = 0
        self.label.adjustsFontSizeToFitWidth = true
        self.label.font = UIFont.systemFont(ofSize: 14)

        self.textField.layer.borderWidth = 1.5
        self.textField.layer.borderColor = Color.LoginTextView.TextField.Border.passive
        self.textField.backgroundColor = Color.LoginTextView.TextField.background
        self.textField.layer.cornerRadius = 4
        self.layer.cornerRadius = 4
        self.textField.autocapitalizationType = UITextAutocapitalizationType.none

        setLeftPadding()
        setupConstraints()
    }

    private func setupConstraints() {
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: TextInputViewDimensions.margin).isActive = true
        self.textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -TextInputViewDimensions.margin).isActive = true
        self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: TextInputViewDimensions.offset).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: self.frame.width/6.92).isActive = true

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
        self.icon = UIImage(named: "ok")
        self.label.alpha = 0
    }

    private func errorLayout() {
        self.label.alpha = 1
        self.textField.textColor = Color.LoginTextView.TextField.Text.error
        self.icon = UIImage(named: "questionMark")
    }

    func textFieldDidEndEditing() {
        self.label.text = errorString
        textField.layer.borderColor = Color.LoginTextView.TextField.Border.passive
        checkText()
    }

    func textFieldIsEditing() {
        textField.placeholder = ""
        textField.layer.borderColor = Color.LoginTextView.TextField.Border.active
        self.textField.textColor = Color.LoginTextView.TextField.Text.regular

    }

    func addIconToTextField() {
        self.textField.rightViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 16))
        imageView.image = icon
        imageView.contentMode = .scaleAspectFit
        self.textField.rightView = imageView
        self.textField.rightView?.isUserInteractionEnabled = false
    }

    func setLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
    }
}
