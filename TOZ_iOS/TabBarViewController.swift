//
//  TabBarViewController.swift
//  TOZ_iOS
//
//  Created by Filip Zieliński on 07/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideAccountTab()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func hideAccountTab() {
        if BackendAuth.shared.token == nil {
        let index = 4
        viewControllers?.remove(at: index)
        }
    }
}
