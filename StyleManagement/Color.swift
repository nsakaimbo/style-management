//
//  Color.swift
//  StyleManagement
//
//  Created by Nicholas Sakaimbo on 5/26/16.
//  Copyright © 2016 nick_skmbo. All rights reserved.
//

import UIKit

// Note: It's a nice idea to mark each color with its corresponding RGB values, so they show up in the autocomplete descriptions

struct Color {
    
    private init() {}
    
    /// red: 0, green: 11, blue: 251
    static let Blue = UIColor(redValue: 0, greenValue: 11, blueValue: 251, alpha: 1)
    
    struct Gray {

        /// red: 230, green: 230, blue: 1
        static let Light = UIColor(redValue: 230, greenValue: 230, blueValue: 230, alpha: 1)
        
        /// red: 200, green: 200, blue: 1
        static let Medium = UIColor(redValue: 200, greenValue: 200, blueValue: 200, alpha: 1)
        
        /// red: 128, green: 128, blue: 128
        static let Dark = UIColor(redValue: 128, greenValue: 128, blueValue: 128, alpha: 1)
        
    }
    
    /// red: 254, green: 56, blue: 36
    static let Yellow = UIColor(redValue: 254, greenValue: 56, blueValue: 36, alpha: 1)
    
    /// red: 0, green: 200, blue: 0
    static let Green = UIColor(redValue: 0, greenValue: 200, blueValue: 0, alpha: 1)
    
}
