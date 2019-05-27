//
//  DismissView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 20/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DismissView: UIView {
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    var lineView: UIView!
	func setup() {
		backgroundColor = .buttonColor
		layer.cornerRadius = 8.0
		layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		lineView = UIView(frame: .zero)
		lineView.translatesAutoresizingMaskIntoConstraints = false
		lineView.backgroundColor = UIColor.white
		addSubview(lineView)
		
		NSLayoutConstraint.activate([
			heightAnchor.constraint(equalToConstant: 32.0),
			lineView.widthAnchor.constraint(equalToConstant: 120.0),
			lineView.heightAnchor.constraint(equalToConstant: 3.0),
			lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
			lineView.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
}
