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
    let organizationInfoOperation = OrganizationInfoOperation()

    override func viewDidLoad() {
        configure(scrollView: helpScrollView)
        configure(UIView: helpVolunteerView)
        configure(UIView: helpFinanceView)
    }
    func configure(scrollView: UIScrollView) {
        scrollView.backgroundColor = Color.Background.primary
    }

    func configure(UIView: UIView) {
        UIView.backgroundColor = Color.HelpUIViews.background
        UIView.layer.shadowColor = UIColor.darkGray.cgColor
        UIView.layer.shadowOffset = CGSize.zero
        UIView.layer.shadowOpacity = 1
        UIView.layer.shadowRadius = 3.0
        UIView.layer.cornerRadius = 3
    }
}
