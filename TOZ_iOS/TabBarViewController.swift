//
//  TabBarViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController, SwitchAccountTabDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        BackendAuth.shared.delegate = self
        switchAccountTab()
    }

    func switchAccountTab() {
        // When user signs in/out remove last viewcontroller from viewControllers
        // so the correct one can be added later
        if self.viewControllers?.count == 5 {
            self.viewControllers?.remove(at: 4)
        }

        var viewControllers: [UIViewController] = self.viewControllers!
        let accountStoryboard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
        let accountTabBarItemIcon = UITabBarItem(title: "KONTO", image: UIImage(named: "tab-bar-user.png"), selectedImage: UIImage(named: "tab-bar-user.png"))

        if BackendAuth.shared.token != nil {
            let changePasswordNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "ChangePasswordNavigationController")
            changePasswordNavigationController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(changePasswordNavigationController)
            self.viewControllers = viewControllers
        } else {
            let loginNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "LoginNavigationController")
            loginNavigationController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(loginNavigationController)
            self.viewControllers = viewControllers
        }
    }
}
