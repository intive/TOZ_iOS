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
    
    var textChecker: TextChecker? = nil
    
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
        
        self.textField.backgroundColor = .red
        
        let textFieldLeft: NSLayoutConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: TextInputViewDimensions.margin)
        let textFieldRight: NSLayoutConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -TextInputViewDimensions.margin)
        let textFieldTop: NSLayoutConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: TextInputViewDimensions.margin)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([textFieldLeft, textFieldRight, textFieldTop])
    }
    
    func checkText() {
        let text = self.textField.text ?? ""
        if let textChecker = self.textChecker {
            if textChecker.check(text: text){
                //configure for success
                print ("ok")
            } else {
                //configure for error
                print ("nope")
            }
        }
    }
    
    private func successLayout() {
        
    }
    
    private func errorLayout() {
        
    }
    
    func textFieldDidEndEditing() {
        checkText()
        textField.resignFirstResponder()
    }
    
}
