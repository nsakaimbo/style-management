//
//  UIColor+ConvenienceInit.swift
//  StyleManagement
//
//  Created by Nicholas Sakaimbo on 1/17/16.
//  Copyright © 2016 nick_skmbo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// Convenience Initializer to convert raw RGB inputs into percentage values
    convenience init(redValue:CGFloat, greenValue:CGFloat, blueValue:CGFloat, alpha: CGFloat){
        let red = redValue/255.0
        let green = greenValue/255.0
        let blue = blueValue/255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
