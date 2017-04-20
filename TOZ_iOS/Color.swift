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
    struct TableView {
        static let separator = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        static let background = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
    }
    struct Background {
        static let primary = UIColor(red:1.00, green:1.00, blue:1.00, alpha: 1.00)
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
            static let primary = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
        }
        struct Icons {
            static let primary = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            static let pressed = UIColor(red: 147.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
    }
    struct Cell {
        struct Background {
            static let primary = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.00)
        }
        struct Font {
            static let title = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            static let content = UIColor(red: 149.0/255.0, green: 152.0/255.0, blue: 154.0/255.0, alpha: 1.0)
            static let date = UIColor(red: 149.0/255.0, green: 152.0/255.0, blue: 154.0/255.0, alpha: 1.0)
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
    struct HelpUIViews {
        static let background = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
    }
}
