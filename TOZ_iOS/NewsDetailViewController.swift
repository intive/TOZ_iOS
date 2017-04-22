//
//  NewsDetailViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var photoImageView: ProfilePhotoView!
    @IBOutlet weak var photoImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contentLabel: UILabel!
    var selectedNews: NewsItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        titleLabel.textColor = Color.Cell.Font.title
        dateLabel.textColor = Color.Cell.Font.date
        contentLabel.textColor = Color.Cell.Font.title
        titleLabel.text = selectedNews?.title
        dateLabel.text = selectedNews?.published?.dateToFormattedString()
        photoImageView.photo = nil
        let photoURL: URL? = selectedNews?.photoUrl
        if let photoURL = photoURL {
            PhotoManager.shared.getPhoto(from: photoURL, completion: {(image) -> (Void) in
                self.photoImageView.photo = image
            })
        } else {
            self.photoImageViewHeight.constant = 0
        }

        contentLabel.text = selectedNews?.contents
    }

}
