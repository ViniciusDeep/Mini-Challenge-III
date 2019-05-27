//
//  UIFont+iWish.swift
//  Mini Challenge III
//
//  Created by Levy Cristian  on 27/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

enum AppFontVariantions: String {
    case semiBold = "-SemiBold"
    case black = "-Black"
    case regular = "-Regular"
    case extraBold = "-ExtraBold"
}

extension UIFont {
    
    static func appFont(with size : CGFloat, and variation : AppFontVariantions ) -> UIFont? {
        return UIFont(name: "Muli\(variation.rawValue)", size: size)
    }
}
