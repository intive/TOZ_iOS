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
    }

    func configure(with news: NewsEntity) {

        titleLabel.text = news.title
        contentTextView.text = news.content
        let dateToString = DateFormatter()
        dateToString.dateFormat = "yyyy-MM-dd"
        datePublishedLabel.text = dateToString.string(from: news.datePublished)
        photoView.photo = news.picture
    }
}
