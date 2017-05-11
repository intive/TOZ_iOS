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
        if self.viewControllers?.count == 5 {
            self.viewControllers?.remove(at: 4)
        }

        var viewControllers: [UIViewController] = self.viewControllers!
        let accountStoryboard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
        let accountTabBarItemIcon = UITabBarItem(title: "Account", image: UIImage(named: "tab-bar-user.png"), selectedImage: UIImage(named: "tab-bar-user.png"))

        if BackendAuth.shared.token != nil {
            // swiftlint:disable force_cast
            let accountViewController = accountStoryboard.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
            accountViewController.delegate = self
            accountViewController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(accountViewController)
            self.viewControllers = viewControllers
        } else {
            // swiftlint:disable force_cast
            let loginViewController = accountStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            loginViewController.delegate = self
            loginViewController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(loginViewController)
            self.viewControllers = viewControllers
        }
    }
}
