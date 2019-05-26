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
		layer.borderColor = UIColor.black.cgColor
		setTitleColor(UIColor.black, for: .normal)
		
		translatesAutoresizingMaskIntoConstraints = false
		heightAnchor.constraint(equalToConstant: 47.0).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
