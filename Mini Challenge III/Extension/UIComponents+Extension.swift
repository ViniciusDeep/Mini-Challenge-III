//
//  UILabel+Extension.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 16/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 2
        self.textAlignment = .center
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.textColor = .gray
    }
    convenience init(text: String, sizeFont: Int) {
        self.init(frame: .zero)
        self.text = text
        self.numberOfLines = 2
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    convenience init(text: String, textColor: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.font = UIFont.systemFont(ofSize: 14)
        self.numberOfLines = 2
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.textColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
extension UIButton {
    convenience init(imageNamed: String) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(named: imageNamed), for: .normal)
    }
}
