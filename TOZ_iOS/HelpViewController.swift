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

    override func viewDidLoad() {
        helpScrollView.backgroundColor = Color.Background.primary
        configureAsTile(helpVolunteerView)
        configureAsTile(helpFinanceView)
    }

    func configureAsTile(_ UIView: UIView) {
        UIView.backgroundColor = Color.HelpUIViews.background
    }
}
