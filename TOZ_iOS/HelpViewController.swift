//
//  HelpViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func financeHelpButton(_ sender: UIButton) {
    performSegue(withIdentifier: "financeView", sender: self)
    }
    @IBAction func unwindToHelp(segue: UIStoryboardSegue) {
    }
    
}
