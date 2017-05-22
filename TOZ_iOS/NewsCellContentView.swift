//
//  NewsCellContentView.swift.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsCellContentView: UIView {
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var readMoreLabel: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = Color.Cell.Background.secondary
        let exclusionPath = UIBezierPath(rect: readMoreLabel.convert(readMoreLabel.bounds, to: contentTextView))
        contentTextView.textContainer.exclusionPaths = [exclusionPath]
    }
}
