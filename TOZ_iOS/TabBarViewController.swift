//
//  TabBarViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController, TabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let accountTabBarItemIcon = UITabBarItem(title: "Account", image: UIImage(named: "tab-bar-user.png"), selectedImage: UIImage(named: "tab-bar-user.png"))

        if BackendAuth.shared.token != nil {
            let changePasswordNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "ChangePasswordNavigationController")
            // swiftlint:disable force_cast
            let changePasswordViewController = accountStoryboard.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
            changePasswordViewController.delegate = self
            changePasswordNavigationController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(changePasswordNavigationController)
            self.viewControllers = viewControllers
        } else {
            let loginNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "LoginNavigationController") as! UINavigationController
            // swiftlint:disable force_cast
            let loginViewController = accountStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            loginViewController.delegate = self
            loginNavigationController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(loginNavigationController)
            self.viewControllers = viewControllers
        }
    }
}
