//
//  GoalHaventStartedView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class GoalHaventStartedView: UIView {
	var imageView: UIImageView!
	var titleLabel: UILabel!
	var descriptionLabel: UILabel!
	var startButton: RoundedButton!
	
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		let stackView = UIStackView(frame: .zero)
		stackView.alignment = .center
		stackView.distribution = .equalSpacing
		stackView.spacing = 8.0
		stackView.axis = .vertical
		stackView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(stackView)
		
		imageView = UIImageView(frame: .zero)
		imageView.image = #imageLiteral(resourceName: "emptyState")
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		stackView.addArrangedSubview(imageView)
		
		titleLabel = UILabel(frame: .zero)
		titleLabel.text = "Title Test"
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		stackView.addArrangedSubview(titleLabel)
		
		descriptionLabel = UILabel(frame: .zero)
		descriptionLabel.text = "Description test"
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		stackView.addArrangedSubview(descriptionLabel)
		
		startButton = RoundedButton()
		stackView.addArrangedSubview(startButton)
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//			positioningView.centerYAnchor.constraint(equalTo: centerYAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 175.0),
			imageView.heightAnchor.constraint(equalToConstant: 211.0)
//			imageView.topAnchor.constraint(equalTo: positioningView.topAnchor),
//			imageView.centerXAnchor.constraint(equalTo: positioningView.centerXAnchor),
//			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8.0),
//			titleLabel.centerXAnchor.constraint(equalTo: positioningView.centerXAnchor),
//			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
//			descriptionLabel.centerXAnchor.constraint(equalTo: positioningView.centerXAnchor),
//			startButton.leadingAnchor.constraint(equalTo: positioningView.leadingAnchor, constant: 8.0),
//			startButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8.0),
//			startButton.trailingAnchor.constraint(equalTo: positioningView.trailingAnchor, constant: -8.0),
//			startButton.bottomAnchor.constraint(equalTo: positioningView.bottomAnchor)
		])
	}
}
