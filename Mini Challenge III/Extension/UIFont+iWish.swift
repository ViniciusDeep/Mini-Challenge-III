//
//  UIFont+iWish.swift
//  Mini Challenge III
//
//  Created by Levy Cristian  on 27/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

enum AppFontVariantions: String {
    case bold = "-Bold"
    case light = "-Light"
    case regular = "-Regular"
}

extension UIFont {
    
    static func appFont(with size : CGFloat, and variation : AppFontVariantions ) -> UIFont? {
        return UIFont(name: "Nunito\(variation.rawValue)", size: size)
    }
}

