//
//  StepCollectionViewCell.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 14/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class StepCollectionViewCell: UICollectionViewCell {
	var checkButton: UIButton!
	var titleLabel: UILabel!
	var descriptionLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc fileprivate func checkStep(button: UIButton) {
		switch button.isSelected {
		case true:
			button.setImage(UIImage(named: "uncheck"), for: .normal)
			button.isSelected = false
		case false:
			button.setImage(UIImage(named: "check"), for: .normal)
			button.isSelected = true
		}
	}
	
	func setup() {
		backgroundColor = UIColor.white
		layer.cornerRadius = 8
		clipsToBounds = true
		
		checkButton = UIButton(frame: .zero)
		checkButton.translatesAutoresizingMaskIntoConstraints = false
		checkButton.addTarget(self, action: #selector(checkStep(button:)), for: .touchUpInside)
		checkButton.setImage(UIImage(named: "uncheck"), for: .normal)
		addSubview(checkButton)
		
		titleLabel = UILabel(frame: .zero)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "O passo"
		titleLabel.textAlignment = .center
		addSubview(titleLabel)
		
		descriptionLabel = UILabel(frame: .zero)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.text = "Esse é meu primeiro passo"
		descriptionLabel.textAlignment = .center
		addSubview(descriptionLabel)
		
		NSLayoutConstraint.activate([
			checkButton.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
			checkButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
			titleLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 8.0),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
			descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
			descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
			descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	func setContent() {
		
	}
}
