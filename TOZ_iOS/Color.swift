//
//  Color.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

import Foundation

// swiftlint:disable nesting
struct Color {

    struct LoginTextView {
        struct TextField {
            static let background = UIColor.white
            struct Border {
                //light blue
                static var active = UIColor(red: 50.0/255.0, green: 155.0/255.0, blue: 245.0/255.0, alpha: 1.0).cgColor
                //light gray
                static let passive = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0).cgColor
            }
            struct Text {
                //red
                static let error = UIColor(red: 245.0/255.0, green: 75.0/255.0, blue: 94.0/255.0, alpha: 1.0)
                //black
                static let regular = UIColor(red: 54.0/255.0, green: 54.0/255.0, blue: 54.0/255.0, alpha: 1.0)
            }
        }
        struct Label {
            //red
            static let error = UIColor(red: 245.0/255.0, green: 75.0/255.0, blue: 94.0/255.0, alpha: 1.0)
            //green
            static let success = UIColor(red: 76.0/255.0, green: 211.0/255.0, blue: 116.0/255.0, alpha: 1.0)
        }
    }

    struct TableView {
        //light blue
        static let separator = UIColor(red: 50.0/255.0, green: 155.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        static let background = UIColor.white
    }

    struct Background {
        static let primary = UIColor.white
        static let secondary = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    }

    struct TitleBar {
        struct Background {
            //green
            static let primary = UIColor(red: 76.0/255.0, green: 211.0/255.0, blue: 116.0/255.0, alpha: 1.0)
        }
        struct Button {
            static let primary = UIColor.white
            //light blue
            static let pressed = UIColor(red: 50.0/255.0, green: 155.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        }
    }

    struct TabBar {
        struct Background {
            //black
            static let primary = UIColor(red: 54.0/255.0, green: 54.0/255.0, blue: 54.0/255.0, alpha: 1.0)
        }
        struct Icons {
            //gray
            static let primary = UIColor(red: 185.0/255.0, green: 185.0/255.0, blue: 185.0/255.0, alpha: 1.0)
            //white
            static let pressed = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
    }

    struct NewsDetailView {
        struct Font {
            //gray
            static let date = UIColor(red: 185.0/255.0, green: 185.0/255.0, blue: 185.0/255.0, alpha: 1.0)
            //black
            static let title = UIColor(red: 54.0/255.0, green: 54.0/255.0, blue: 54.0/255.0, alpha: 1.0)
            //gray
            static let content = UIColor(red: 185.0/255.0, green: 185.0/255.0, blue: 185.0/255.0, alpha: 1.0)
        }
        struct Background {
            //light gray
            static let primary = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
            static let secondary = UIColor.white
        }

    }

    struct Cell {
        struct Background {
            //light gray
            static let primary = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
            static let secondary = UIColor.white
        }
        struct Font {
            //black
            static let title = UIColor(red: 54.0/255.0, green: 54.0/255.0, blue: 54.0/255.0, alpha: 1.0)
            //gray
            static let content = UIColor(red: 175.0/255.0, green: 175.0/255.0, blue: 175.0/255.0, alpha: 1.0)
            //gray
            static let date = UIColor(red: 175.0/255.0, green: 175.0/255.0, blue: 175.0/255.0, alpha: 1.0)
        }
        struct Button {
            //orange
            static let primary = UIColor(red: 253.0/255.0, green: 137.0/255.0, blue: 36.0/255.0, alpha: 1.0)
            static let text = UIColor.white
            //light blue
            static let secondary = UIColor(red: 50.0/255.0, green: 155.0/255.0, blue: 245.0/255.0, alpha: 1.0)
            //light blue
            static let pressed = UIColor(red: 122.0/255.0, green: 122.0/255.0, blue: 122.0/255.0, alpha: 1.0)

            struct Icon {
                //light blue
                static let primary = UIColor(red: 50.0/255.0, green: 155.0/255.0, blue: 245.0/255.0, alpha: 1.0)
                //light blue
                static let secondary = UIColor(red: 50.0/255.0, green: 155.0/255.0, blue: 245.0/255.0, alpha: 1.0)
                //light blue
                static let pressed = UIColor(red: 50.0/255.0, green: 155.0/255.0, blue: 245.0/255.0, alpha: 1.0)

            }
        }
    }

    struct HelpUIViews {
        static let background = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    }

    struct Calendar {
        static let background = UIColor.white
        //light gray
        static let separator = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        struct DataLabel {
            //black
            static let text = UIColor(red: 54.0/255.0, green: 54.0/255.0, blue: 54.0/255.0, alpha: 1.0)
            static let background = UIColor.white
        }
        struct PreviousButton {
            //gray
            static let text = UIColor(red: 185.0/255.0, green: 185.0/255.0, blue: 185.0/255.0, alpha: 1.0)
            static let background = UIColor.white
        }
        struct NextButton {
            static let text = UIColor.white
            //green
            static let background = UIColor(red: 76.0/255.0, green: 211.0/255.0, blue: 116.0/255.0, alpha: 1.0)
        }
        struct WeekDayControl {
            struct DayName {
                struct primary {
                    //green
                    static let text = UIColor(red: 76.0/255.0, green: 211.0/255.0, blue: 116.0/255.0, alpha: 1.0)
                    static let background = UIColor.white
                    static let border = UIColor.white
                }
                struct pressed {
                    //green
                    static let text = UIColor(red: 76.0/255.0, green: 211.0/255.0, blue: 116.0/255.0, alpha: 1.0)
                    static let background = UIColor.white
                    static let border = UIColor.white
                }
            }
            struct DayNumber {
                struct primary {
                    //dark green
                    static let text = UIColor(red: 40.0/255.0, green: 174.0/255.0, blue: 97.0/255.0, alpha: 1.0)
                    static let background = UIColor.white
                    static let border = UIColor.white
                }
                struct pressed {
                    //light gray
                    static let text = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
                    static let background = UIColor.white
                    //gray
                    static let border = UIColor(red: 185.0/255.0, green: 185.0/255.0, blue: 185.0/255.0, alpha: 1.0)
                }
            }
        }
        struct ScheduleControl {
            struct primary {
                static let text = UIColor.white
                static let background = UIColor.white
                //gray
                static let border = UIColor(red: 185.0/255.0, green: 185.0/255.0, blue: 185.0/255.0, alpha: 1.0)
            }
            struct pressed {
                static let text = UIColor.white
                //green
                static let background = UIColor(red: 76.0/255.0, green: 211.0/255.0, blue: 116.0/255.0, alpha: 1.0)
                //dark green
                static let border = UIColor(red: 40.0/255.0, green: 174.0/255.0, blue: 97.0/255.0, alpha: 1.0)
            }
        }
    }
    struct LoginViewController {
        static let background = UIColor.white

        struct Button {
            //orange
            static let background = UIColor(red: 253.0/255.0, green: 137.0/255.0, blue: 36.0/255.0, alpha: 1.0)
            //white
            static let tint = UIColor.white
        }
    }
    struct SignUpViewController {
        static let background = UIColor.white
        struct Button {
            static let background = UIColor(red: 1.00, green: 0.53, blue: 0.22, alpha: 1.0)
            static let tint = UIColor.white
        }
        struct SegmentedControl {
            static let background = UIColor.white
            static let tint = UIColor(red: 1.00, green: 0.53, blue: 0.22, alpha: 1.0)
        }
    }
}
