//
//  ColorUtil.swift
//  Marvel Hero Index
//
//  Created by Mike Stuck on 4/11/17.
//  Copyright © 2017 Mike Stuck. All rights reserved.
//

import Foundation
import UIKit


class ColorUtil: NSObject{
    static let marvelRedColor = UIColor(red: 135, green: 208, blue: 197)
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
