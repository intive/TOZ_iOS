//
//  ProfilePhotoView.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

fileprivate struct Dimensions {
    static let margin: CGFloat = 10
    static let nameAgeHeight: CGFloat = 15
    static let offset: CGFloat = 10
    static let nameAgeFrame: CGRect = CGRect(x: 0, y: 0, width: 0, height: nameAgeHeight)
}

class ProfilePhotoView: UIView {

    private let photoImageView = UIImageView()
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    
    var photo: UIImage? {
        didSet {
            if photoImageView.image == nil{
                addPlaceholder()
            } else {
                photoImageView.image = photo
            }
        }
    }
    
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var age: Int = 0 {
        didSet {
            ageLabel.text = String(age)
        }
    }
    
    private func setupView() {
        self.addSubview(photoImageView)
        self.addSubview(nameLabel)
        self.addSubview(ageLabel)
        self.backgroundColor = .red
        
        self.photoImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.nameLabel.frame = Dimensions.nameAgeFrame
        self.ageLabel.frame = Dimensions.nameAgeFrame
        
        let ageLabelLeft: NSLayoutConstraint = NSLayoutConstraint(item: ageLabel, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: Dimensions.margin)
        let ageLabelBottom: NSLayoutConstraint = NSLayoutConstraint(item: ageLabel, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -Dimensions.margin)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabelLeft: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: Dimensions.margin)
        let nameLabelBottom: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.bottomMargin, relatedBy: NSLayoutRelation.equal, toItem: self.ageLabel, attribute: NSLayoutAttribute.top, multiplier: 1, constant: -Dimensions.offset)
        let nameLabelRight: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -Dimensions.margin)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let photoImageViewLeft: NSLayoutConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0)
        let photoImageViewRight: NSLayoutConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)
        let photoImageViewTop: NSLayoutConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let photoImageViewBottom: NSLayoutConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(ageLabelLeft)
        self.addConstraint(ageLabelBottom)
        self.addConstraint(nameLabelLeft)
        self.addConstraint(nameLabelBottom)
        self.addConstraint(nameLabelRight)
        self.addConstraint(photoImageViewLeft)
        self.addConstraint(photoImageViewRight)
        self.addConstraint(photoImageViewTop)
        self.addConstraint(photoImageViewBottom)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func addPlaceholder() {
        self.photoImageView.image = UIImage(named: "first")
    }
}
