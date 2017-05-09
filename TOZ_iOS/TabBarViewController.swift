//
//  TabBarViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

//    static let shared = TabBarViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        showAccountTab()
    }

    func showAccountTab() {
        if BackendAuth.shared.token != nil {
            var viewControllers: [UIViewController] = self.viewControllers!
            let storyboard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
            let accountViewController = storyboard.instantiateViewController(withIdentifier: "AccountNavigationController")
            let accountTabBarItemIcon = UITabBarItem(title: "Account", image: UIImage(named: "tab-bar-user.png"), selectedImage: UIImage(named: "tab-bar-user.png"))
            accountViewController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(accountViewController)
            self.viewControllers = viewControllers
        }
    }

    func hideAccountTab() {
        if BackendAuth.shared.token == nil {
            let accountTabIndex = 4
            viewControllers?.remove(at: accountTabIndex)
        }
    }
}
