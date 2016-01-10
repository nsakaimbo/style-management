//
//  StyleKit.swift
//  StyleManagement
//
//  Created by Nicholas Sakaimbo on 1/10/16.
//  Copyright © 2016 nick_skmbo. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Global styles/attributes can be set here
struct StyleKit {
    // we use private initializers so that (1) the initializer doesn't clutter up our autocomplete, and (2) to prevent any external changes to our declarations
    private init() {}
    struct Fonts {
        private init() {}
        static func regularFont() -> String { return "HelveticaNeue-Medium" }
        static func lightFont() -> String { return "HelveticaNeue-Light" }
        static func boldFont() -> String { return "HelveticaNeue-Bold" }
        static func condensedBoldFont() -> String { return "HelveticaNeue-CondensedBold" }
    }
    
    // color palette - light to dark
    // if you're wondering about these crazy color names, check this out: http://chir.ag/projects/name-that-color/
    // you can (and probably should!) use more descriptive/straightforward names
    struct Colors {
        private init() {}
        /// lightest
        static func kidnapper() -> UIColor { return UIColor(redValue: 229.0, greenValue: 236.0, blueValue: 219.0, alpha: 1.0) }
        /// light
        static func potPourri() -> UIColor { return UIColor(redValue: 242.0, greenValue: 221.0, blueValue: 213.0, alpha: 1.0) }
        /// medium
        static func tonysPink() -> UIColor { return UIColor(redValue: 232.0, greenValue: 148.0, blueValue: 150.0, alpha: 1.0) }
        /// dark
        static func tomThumb() -> UIColor { return UIColor(redValue: 59.0, greenValue: 80.0, blueValue: 54.0, alpha: 1.0) }
    }
}

// MARK: - UINavigationBar Appearance
extension StyleKit {
    
    struct Navigation {
        private init() {}
        static func setNavigationStyle() {
            UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
            UINavigationBar.appearance().translucent = false
            UINavigationBar.appearance().titleTextAttributes = navigationTitleAttributes()
            UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: .Default)
            // note the explicit use of the Project/Application name below. We may need to do this occasionally since we have similarly-named structs within our StyleKit and the compiler may complain
            UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([StyleManagement.NavigationController]).setTitleTextAttributes(navigationItemTitleAttributes(), forState: .Normal)
            UINavigationBar.appearance().shadowImage = UIImage()
        }
        
        static func navigationTitleAttributes() -> [String:AnyObject] {
            return [
                NSFontAttributeName: UIFont(name: StyleKit.Fonts.boldFont(), size: 20.0)!,
                NSForegroundColorAttributeName: StyleKit.Colors.tomThumb()
            ]
        }
        
        static func navigationItemTitleAttributes() -> [String:AnyObject] {
            return [
                NSFontAttributeName: UIFont(name: StyleKit.Fonts.regularFont(), size: 15.0)!,
                NSForegroundColorAttributeName: StyleKit.Colors.tonysPink()
            ]
        }
    }
}

// MARK: - TableViewController Class Styles
extension StyleKit {
    
    struct TableViewController {
        
        struct TableViewCell {
            private init() {}
            static let dateFormatter: NSDateFormatter = {
                let _formatter = NSDateFormatter()
                _formatter.dateStyle = .ShortStyle
                _formatter.timeStyle = .NoStyle
                return _formatter
            }()
            
            static func locationLabelTextColor() -> UIColor {
                return UIColor.whiteColor()
            }
            
            static func locationLabelFont() -> UIFont {
                return UIFont(name: StyleKit.Fonts.boldFont(), size: 15.0)!
            }
            
            static func dateLabelTextAttributes() -> [String:AnyObject]{
                return [
                    NSFontAttributeName: UIFont(name: StyleKit.Fonts.regularFont(), size: 15.0)!,
                    NSForegroundColorAttributeName: UIColor.whiteColor()
                ]
            }
        }
    }
}

// MARK: - ViewController Class Styles
extension StyleKit {
    
    struct ViewController {
        private init() {}
        static func viewControllerBackgroundColor() -> UIColor { return StyleKit.Colors.potPourri() }
        static func imageViewShadowColor() -> UIColor { return StyleKit.Colors.tomThumb()}
        static func descriptionTextAttributes() -> [String:AnyObject] {
            return [
                NSFontAttributeName: UIFont(name: StyleKit.Fonts.boldFont(), size: 15.0)!,
                NSForegroundColorAttributeName: StyleKit.Colors.tomThumb()
            ]
        }
    }
}

class NavigationController: UINavigationController {}