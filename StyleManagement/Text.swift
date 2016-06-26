//
//  Text.swift
//  StyleManagement
//
//  Created by Nicholas Sakaimbo on 6/3/16.
//  Copyright © 2016 nick_skmbo. All rights reserved.
//

import UIKit

struct Text {
    
    struct Font {
        static let Regular = "HelveticaNeue-Medium"
        static let Light = "HelveticaNeue-Light"
        static let Bold = "HelveticaNeue-Bold"
        static let CondensedBold = "HelveticaNeue-CondensedBold"
        
    }
    
    static let dateFormatter: NSDateFormatter = {
        let _formatter = NSDateFormatter()
        _formatter.dateStyle = .ShortStyle
        _formatter.timeStyle = .NoStyle
        return _formatter
    }()
    
    static let dateLabelTextAttributes = [
        NSFontAttributeName: UIFont(name: Text.Font.Regular, size: 15.0)!,
        NSForegroundColorAttributeName: UIColor.whiteColor()
    ]
    
    static let navigationItemTitleAttributes = [
        NSFontAttributeName: UIFont(name: Text.Font.Regular, size: 15.0)!,
        NSForegroundColorAttributeName: Color.Gray.Dark
    ]
    
}