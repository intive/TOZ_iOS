//
//  NewsTableViewCell.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePublishedLabel: UILabel!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var contentTextView: UITextView!

    func configure(with news: NewsEntity) {

        titleLabel.text = news.title
        contentTextView.text = news.content
        contentTextView.backgroundColor = Color.Cell.Background.primary
        let dateToString = DateFormatter()
        dateToString.dateFormat = "yyyy-MM-dd"
        datePublishedLabel.text = dateToString.string(from: news.datePublished)

        let pictureInView = UIImageView(image: news.picture)
        pictureInView.frame = CGRect(x: 0, y: 0, width: photoView.frame.width, height: photoView.frame.height)
        photoView.addSubview(pictureInView)
        photoView.backgroundColor = Color.Cell.Background.primary
    
        if news.picture == nil {
            let lackOfPictuteConstraint:NSLayoutConstraint = NSLayoutConstraint(item: contentTextView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1, constant: 10)
            
            photoView.translatesAutoresizingMaskIntoConstraints = false
            self.addConstraint(lackOfPictuteConstraint)
        }
        
    }
    
    
}
