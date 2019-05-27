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
    static let titleColor = UIColor(red:0.28, green:0.47, blue:0.84, alpha:1.0)
    static let navItemColor = UIColor(red:1, green:1, blue:1, alpha:1.0)
    static let navTintBarColor = UIColor(red:0.28, green:0.47, blue:0.84, alpha:1.0)
    static let createGoalViewColor = UIColor(red:1, green:1, blue:1, alpha:1.0)
    static let tableViewColor = UIColor(red:1, green:1, blue:1, alpha:1.0)
    static let indicatorColor = UIColor(red:0.28, green:0.47, blue:0.84, alpha:1.0)
    static let trackLayerColor = UIColor(red:0.02, green:1.00, blue:0.00, alpha:1.0)
    static let textsColor = UIColor(red:0.44, green:0.44, blue:0.44, alpha:1.0)
    static let buttonColor = UIColor(red:0.28, green:0.47, blue:0.84, alpha:1.0)
    
}

extension UIColor{
    
    static var backgroundColor: UIColor {
        return Color.backgroundColor
    }
    
    static var navBarBackground: UIColor {
        return Color.navBarBackground
    }
    
    static var buttonTitleColor: UIColor {
        return Color.titleColor
    }
    
    static var navigationItemColor: UIColor {
        return Color.navItemColor
    }
    
    static var tintBarColor: UIColor {
        return Color.navTintBarColor
    }
    
    static var createGoalViewColor: UIColor {
        return Color.createGoalViewColor
    }
    
    static var tableViewColor: UIColor {
        return Color.tableViewColor
    }
    
    static var indicatorColor: UIColor {
        return Color.indicatorColor
    }
    
    static var trackLayerColor: UIColor {
        return Color.trackLayerColor
    }
    
    static var textsColor: UIColor {
        return Color.textsColor
    }
    
    static var buttonColor: UIColor {
        return Color.buttonColor
    }
    
}
