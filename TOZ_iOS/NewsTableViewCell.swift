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
    @IBOutlet weak var photoView: ProfilePhotoView!
    @IBOutlet weak var photoViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var readMoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Color.Cell.Background.primary
        self.titleLabel.textColor = Color.Cell.Font.title
        self.datePublishedLabel.textColor = Color.Cell.Font.date
        self.contentTextView.textColor = Color.Cell.Font.content
        self.contentTextView.textContainer.maximumNumberOfLines = 2
        self.contentTextView.isUserInteractionEnabled = false
    }

    func configure(with news: NewsItem) {
        titleLabel.text = news.title
        contentTextView.text = news.contents
        if let published = news.published {
            datePublishedLabel.text = published.dateToFormattedString()
        }
        self.photoView.photo = nil
        let photoURL: URL? = news.photoUrl
        if let photoURL = photoURL {
            PhotoManager.shared.getPhoto(from: photoURL, completion: {(image) -> (Void) in
                if photoURL == news.photoUrl {
                    self.photoView.photo = image
                }
            })
        } else {
            self.photoViewHeight.constant = 0
        }
    }
}
