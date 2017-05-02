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
    static let offset: CGFloat = 5
    static let textFieldHeight: CGFloat = 24
    static let labelHeight: CGFloat = 18
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
        return textChecker?.check(text: text) ?? false
    }

    var placeholder: String = "" {
        didSet {
            self.textField.placeholder = placeholder
        }
    }

    var icon: UIImage? {
        didSet {
            configureView()
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
        if let icon = self.icon {
            self.textField.leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 16))
            imageView.image = icon
            imageView.contentMode = .scaleAspectFit
            self.textField.leftView = imageView
        }

        setupConstraints()
    }

    func setupConstraints() {
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
