//
//  HelpViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import SVProgressHUD

class HelpViewController: UIViewController {

    @IBOutlet var helpScrollView: UIScrollView!
    @IBOutlet weak var helpFinanceView: UIView!
    @IBOutlet weak var helpVolunteerView: UIView!

    override func viewDidLoad() {
        helpScrollView.backgroundColor = Color.Background.primary
        helpVolunteerView.backgroundColor = Color.HelpUIViews.background
        helpFinanceView.backgroundColor = Color.HelpUIViews.background
    }
}
