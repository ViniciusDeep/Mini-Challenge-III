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
    convenience init(text: String, sizeFont: CGFloat) {
        self.init(frame: .zero)
        self.text = text
        self.numberOfLines = 2
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.font = UIFont.boldSystemFont(ofSize: sizeFont)
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
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font =  UIFont(name: "Helvetica", size: 20)
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.4745098039, blue: 0.8431372549, alpha: 1)
        self.layer.borderColor = UIColor.white.cgColor
    }
}

extension UIImageView {
    convenience init(imagedNamed: String) {
        self.init()
        self.image = UIImage(named: imagedNamed)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    convenience init(indentifier: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
