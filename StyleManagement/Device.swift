//
//  Created by Nicholas Sakaimbo on 11/13/15.
//  Copyright © 2015 Lemon. All rights reserved.
//

import Foundation
import UIKit

/// Global helper class to return Device-specific attributes 
class Device {
    
    static let screenHeight: CGFloat = {
        return UIScreen.mainScreen().fixedCoordinateSpace.bounds.height
    }()
    
    static let screenWidth: CGFloat = {
        return UIScreen.mainScreen().fixedCoordinateSpace.bounds.width
    }()
    
    /// Returns status bar height
    static let statusBarHeight = {
        return UIApplication.sharedApplication().statusBarFrame.size.height
    }()
}
