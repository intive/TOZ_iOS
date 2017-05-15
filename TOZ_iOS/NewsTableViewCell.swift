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
    @IBOutlet weak var contentLabel: UITextView!
    @IBOutlet weak var readMoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Color.Cell.Background.primary
        self.titleLabel.textColor = Color.Cell.Font.title
        self.datePublishedLabel.textColor = Color.Cell.Font.date
        self.contentLabel.textColor = Color.Cell.Font.content
        self.contentLabel.textContainer.maximumNumberOfLines = 2
    }

    func viewDidLayoutSubviews() {
        let exclusionPath = UIBezierPath(rect: readMoreLabel.convert(readMoreLabel.bounds, to: contentLabel))
        contentLabel.textContainer.exclusionPaths = [exclusionPath]
    }

    func configure(with news: NewsItem) {
        titleLabel.text = news.title
        contentLabel.text = news.contents
        let dateToString = DateFormatter()
        dateToString.dateFormat = "yyyy-MM-dd"
        if let published = news.published {
            datePublishedLabel.text = dateToString.string(from: published)
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
