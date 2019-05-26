//
//  RoundedButton.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
	init() {
		super.init(frame: .zero)
		layer.cornerRadius = 8.0
		layer.borderWidth = 1.0
		layer.borderColor = UIColor.white.cgColor
		setTitleColor(UIColor.white, for: .normal)
		self.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.4745098039, blue: 0.8431372549, alpha: 1)
		translatesAutoresizingMaskIntoConstraints = false
		heightAnchor.constraint(equalToConstant: 47.0).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
