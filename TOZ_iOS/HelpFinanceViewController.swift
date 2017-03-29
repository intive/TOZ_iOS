//
//  HelpFinanceViewController.swift
//  TOZ_iOS
//
//  Created by Kobsonauta on 28.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpFinanceViewController: UIViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HelpBackButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "financeView", sender: self)
    }
}
