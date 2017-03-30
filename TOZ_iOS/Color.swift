//
//  color.swift
//  TOZ_iOS
//
//  Created by KTylke on 08.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

import Foundation

// swiftlint:disable nesting
struct Color {
    struct Background {
        static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    struct TitleBar {
        struct Background {
            static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
        struct Button {
            static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)

            static let pressed = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
    }
    struct TabBar {
        struct Background {
            static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
        struct Icons {
            static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            static let pressed = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
    }
    struct Cell {
        struct Background {
            static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
        struct Button {
            static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            static let secondary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            static let pressed = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            struct Icon {
                static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
                static let secondary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
                static let pressed = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)

            }
        }
    }
}
