//
//  TabBarViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

let signInOrOutNotificationKey = "signInOrOut"

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(switchAccountTab), name: Notification.Name(rawValue: signInOrOutNotificationKey), object: nil)
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
        var targetNavigationController: UIViewController

        if BackendAuth.shared.token != nil {
            targetNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "ChangePasswordNavigationController")
        } else {
            targetNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        }

            targetNavigationController.tabBarItem = accountTabBarItemIcon
            viewControllers.append(targetNavigationController)
            self.viewControllers = viewControllers
    }
}
