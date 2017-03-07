//
//  ProfilePhotoView.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ProfilePhotoView : UIView {
    
    var photo = UIImageView()
    var name = UILabel()
    var age = UILabel()
    
    convenience init(frame: CGRect, photo: UIImage?, name: String, age: Int) {
        self.init(frame: frame)
        self.photo.image = photo
        self.name.text = name
        self.age.text = "\(String(age)) lata"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSubviews()
        self.addSubview(photo)
        self.addSubview(name)
        self.addSubview(age)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ProfilePhotoView is not compatible with NSCoder")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margin: CGFloat = 10
        
        self.photo = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.name = UILabel(frame: CGRect(x: margin, y: frame.size.height * 0.7, width: frame.size.width - margin, height: 20))
        self.age = UILabel(frame: CGRect(x: margin, y: frame.size.height * 0.7 + name.frame.size.height + margin/2 , width: frame.size.width - margin, height: 15))
        
        self.backgroundColor = .gray
    }

}
