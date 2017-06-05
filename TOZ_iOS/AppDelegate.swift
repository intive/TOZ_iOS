//
//  AppDelegate.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import HockeySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.portrait
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        BITHockeyManager.shared().configure(withIdentifier: "1c4560d21290458c8ae1e5156e194155")
        BITHockeyManager.shared().start()

        UITableView.appearance().backgroundColor = Color.TableView.background
        UITableView.appearance().separatorColor = Color.TableView.separator
        UITableViewCell.appearance().backgroundColor = Color.Cell.Background.primary

        UITabBar.appearance().barTintColor = Color.TabBar.Background.primary
        UITabBar.appearance().tintColor = Color.TabBar.Icons.pressed
        UITabBar.appearance().unselectedItemTintColor = Color.TabBar.Icons.primary
        UITabBar.appearance().barStyle = .black

        UINavigationBar.appearance().barTintColor = Color.TitleBar.Background.primary
        UINavigationBar.appearance().tintColor = Color.TitleBar.Button.primary
        UINavigationBar.appearance().barStyle = .black

        return true
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }

}
