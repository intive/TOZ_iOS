//
//  UIViewController+Rotation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }

    func lockOrientationAndRotate(orientation: UIInterfaceOrientationMask, andRotateTo: UIInterfaceOrientation) {
        self.lockOrientation(orientation)
        UIDevice.current.setValue(andRotateTo.rawValue, forKey: "orientation")
    }

}
