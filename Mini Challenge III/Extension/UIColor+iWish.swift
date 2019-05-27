//
//  UIColor+iWish.swift
//  Mini Challenge III
//
//  Created by Levy Cristian  on 27/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

struct Color {
    static let backgroundColor = UIColor(red:0.97, green:0.98, blue:1.00, alpha:1.0)
    static let navBarBackground = UIColor(red:0.28, green:0.47, blue:0.84, alpha:1.0)
    
}

extension UIColor{
    static var backgroundColor: UIColor {
        return Color.backgroundColor
    }
    
    static var navBarBackground: UIColor {
        return Color.navBarBackground
    }
    
}
