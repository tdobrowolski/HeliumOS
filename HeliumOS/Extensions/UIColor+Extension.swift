//
//  UIColor+Extension.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 19/04/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import UIKit

extension UIColor {
    var rgb: (red: Float, green: Float, blue: Float) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return (Float(red), Float(green), Float(blue))
    }
}
