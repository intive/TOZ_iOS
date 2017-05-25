//
//  HelpViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet var helpScrollView: UIScrollView!
    @IBOutlet weak var helpFinanceView: UIView!
    @IBOutlet weak var helpVolunteerView: UIView!
    @IBOutlet weak var helpActivityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        helpScrollView.backgroundColor = Color.Background.primary
        helpVolunteerView.backgroundColor = Color.HelpUIViews.background
        helpFinanceView.backgroundColor = Color.HelpUIViews.background
    }

    func viewDidStartLoad (_:UIScrollView) {
        helpActivityIndicator.startAnimating()
    }

    func viewDidFinishLoad (_:UIScrollView) {
        helpActivityIndicator.stopAnimating()
    }
}
