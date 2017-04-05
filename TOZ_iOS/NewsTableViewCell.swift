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
    @IBOutlet weak var contentTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentTextView.isUserInteractionEnabled = false
        self.backgroundColor = Color.Cell.Background.primary
    }

    func configure(with news: NewsItem) {

        titleLabel.text = news.title
        contentTextView.text = news.contents
        let dateToString = DateFormatter()
        dateToString.dateFormat = "yyyy-MM-dd"
        datePublishedLabel.text = dateToString.string(from: news.published)
        self.photoView.photo = nil
        let photoURL: String? = news.photoUrl
        if let photoURL = photoURL {
            PhotoManager.shared.getPhoto(from: "\(BackendConfiguration.shared.baseURL)/" + photoURL, completion: {(image) -> (Void) in
                self.photoView.photo = image
            })
        }
    }

}
