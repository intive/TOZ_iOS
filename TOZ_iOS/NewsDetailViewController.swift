//
//  NewsDetailViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var selectedImageView: ProfilePhotoView!
    @IBOutlet weak var selectedContentLabel: UILabel!
    var selectedCell: NewsTableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedCell?.titleLabel.text
        selectedDateLabel.text = selectedCell?.datePublishedLabel.text
        selectedImageView.photo = selectedCell?.photoView.photo
        selectedContentLabel.text = selectedCell?.contentTextView.text
    }

}
