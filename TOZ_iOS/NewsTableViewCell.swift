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
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var contentTextView: UILabel!

    func configure(with news: NewsEntity) {

        titleLabel.text = news.title
        contentTextView.text = news.content
        contentTextView.backgroundColor = Color.Cell.Background.primary
        let dateToString = DateFormatter()
        dateToString.dateFormat = "yyyy-MM-dd"
        datePublishedLabel.text = dateToString.string(from: news.datePublished)

        photoView.image = news.picture
        photoView.backgroundColor = Color.Cell.Background.primary

    }

}
