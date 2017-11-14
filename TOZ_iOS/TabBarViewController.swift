//
//  TabBarViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(switchAccountTab), name: .backendAuthStateChanged, object: nil)
        switchAccountTab()
    }

    @objc func switchAccountTab() {
        // When user signs in/out remove last viewcontroller(s) from viewControllers
        // so the correct one(s) can be added later
        if self.viewControllers?.count == 5 {
            self.viewControllers?.remove(at: 4)
            self.viewControllers?.remove(at: 3)
        } else if self.viewControllers?.count == 4 {
            self.viewControllers?.remove(at: 3)
        }

        var viewControllers: [UIViewController] = self.viewControllers!

        let accountStoryboard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
        let accountTabBarItemIcon = UITabBarItem(title: "KONTO", image: UIImage(named: "tab-bar-user.png"), selectedImage: UIImage(named: "tab-bar-user.png"))
        var targetNavigationController: UIViewController

        let calendarStoryboard: UIStoryboard = UIStoryboard(name: "Calendar", bundle: nil)
        let calendarTabBarItemIcon = UITabBarItem(title: "GRAFIK", image: UIImage(named: "tab-bar-cal.png"), selectedImage: UIImage(named: "tab-bar-cal.png"))
        let calendarNavigationController: UIViewController

        if BackendAuth.shared.token != nil {
            targetNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "ChangePasswordNavigationController")
            calendarNavigationController = calendarStoryboard.instantiateViewController(withIdentifier: "CalendarNavigationController")
            calendarNavigationController.tabBarItem = calendarTabBarItemIcon
            viewControllers.append(calendarNavigationController)
        } else {
            targetNavigationController = accountStoryboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        }

        targetNavigationController.tabBarItem = accountTabBarItemIcon
        viewControllers.append(targetNavigationController)
        self.viewControllers = viewControllers
    }
}
