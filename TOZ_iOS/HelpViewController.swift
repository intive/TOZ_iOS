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
        UIView.layer.shadowColor = UIColor.darkGray.cgColor
        UIView.layer.shadowOffset = CGSize.zero
        UIView.layer.shadowOpacity = 1
        UIView.layer.shadowRadius = 3.0
        UIView.layer.cornerRadius = 3
    }
}
