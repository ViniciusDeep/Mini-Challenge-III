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
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		addSubview(view)
		
		backgroundColor = UIColor.black
		view.backgroundColor = UIColor.gray
		
		imageView = UIImageView(frame: .zero)
		imageView.image = #imageLiteral(resourceName: "emptyState")
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(imageView)
		
		titleLabel = UILabel(frame: .zero)
		titleLabel.text = "Title Test"
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(titleLabel)
		
		descriptionLabel = UILabel(frame: .zero)
		descriptionLabel.text = "Description test"
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(descriptionLabel)
		
		startButton = RoundedButton()
		view.addSubview(startButton)
		
		NSLayoutConstraint.activate([
			view.leadingAnchor.constraint(equalTo: leadingAnchor),
			view.trailingAnchor.constraint(equalTo: trailingAnchor),
			view.centerYAnchor.constraint(equalTo: centerYAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 175.0),
			imageView.heightAnchor.constraint(equalToConstant: 211.0),
			imageView.topAnchor.constraint(equalTo: view.topAnchor),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8.0),
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
			descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0),
			startButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8.0),
			startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0),
			startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}
