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

    func configure(with news: News) {

        titleLabel.text = news.title
        contentTextView.text = news.content
        let dateToString = DateFormatter()
        dateToString.dateFormat = "yyyy-MM-dd"
        datePublishedLabel.text = dateToString.string(from: news.datePublished)
    }
}
