//
//  CalendarView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CalendarView: UIView {
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = UIColor.gray
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		heightAnchor.constraint(equalToConstant: 70.0).isActive = true
	}
}
