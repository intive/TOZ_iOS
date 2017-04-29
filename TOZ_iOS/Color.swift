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

    struct LoginTextView {
        struct TextField {
            static let background = UIColor.white
            struct BorderShadow {
                static let passive = UIColor.lightGray.cgColor
                static let success = UIColor.green.cgColor
                static let error = UIColor.red.cgColor
            }
        }
        struct Label {
            static let error = UIColor.red
        }
    }

    struct TableView {
        static let separator = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
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
            static let primary = UIColor(red:0.9, green:0.9, blue:0.9, alpha:1.00)
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

    struct Calendar {
        static let background = UIColor.white
        static let separator = UIColor.lightGray
        struct DataLabel {
            static let text = UIColor.darkGray
            static let background = UIColor.white
        }
        struct PreviousButton {
            static let text = UIColor.darkGray
            static let background = UIColor.lightGray
        }
        struct NextButton {
            static let text = UIColor.white
            static let background = UIColor.darkText
        }
        struct WeekDayControl {
            struct DayName {
                struct primary {
                    static let text = UIColor.lightGray
                    static let background = UIColor.white
                    static let border = UIColor.white
                }
                struct pressed {
                    static let text = UIColor.lightGray
                    static let background = UIColor.white
                    static let border = UIColor.white
                }
            }
            struct DayNumber {
                struct primary {
                    static let text = UIColor.darkGray
                    static let background = UIColor.white
                    static let border = UIColor.white
                }
                struct pressed {
                    static let text = UIColor.lightGray
                    static let background = UIColor.white
                    static let border = UIColor.gray
                }
            }
        }
        struct ScheduleControl {
            struct primary {
                static let text = UIColor.white
                static let background = UIColor.white
                static let border = UIColor.gray
            }
            struct pressed {
                static let text = UIColor.darkText
                static let background = UIColor.lightGray
                static let border = UIColor.gray
            }
        }
    }

    struct LoginViewController {
        static let background = UIColor(red: 188.0/255.0, green: 189.0/255.0, blue: 190.0/255.0, alpha: 1.0)

        struct Button {
            static let background = UIColor.white
            static let tint = UIColor(red: 129.0/255.0, green: 130.0/255.0, blue: 131.0/255.0, alpha: 1.0)
        }
    }
}
