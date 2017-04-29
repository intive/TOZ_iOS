//
//  MyNavBarController.swift
//
//
//  Created by Kobsonauta on 29.04.2017.
//
//

import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = Color.TitleBar.Background.primary
        self.navigationBar.tintColor = Color.TitleBar.Font.primary
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color.TitleBar.Font.primary]
    }
}
