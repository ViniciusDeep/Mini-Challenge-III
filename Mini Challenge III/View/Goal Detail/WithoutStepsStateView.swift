//
//  WithoutStepsStateView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 14/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

protocol WithoutStepsDelegate {
	func createStep()
}

class WithoutStepsStateView: UIView {
	var titleLabel: UILabel!
	var descriptionLabel: UILabel!
	var createStepButton: RoundedButton!
	
	var delegate: WithoutStepsDelegate?
	
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func createStepAction() {
		delegate?.createStep()
	}
	
	func setup() {
		let containerView = UIView(frame: .zero)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(containerView)
		
		titleLabel = UILabel(frame: .zero)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "A title"
		titleLabel.textAlignment = .center
		containerView.addSubview(titleLabel)
		
		descriptionLabel = UILabel(frame: .zero)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.text = "some description"
		descriptionLabel.textAlignment = .center
		containerView.addSubview(descriptionLabel)
		
		createStepButton = RoundedButton()
		createStepButton.setTitle("Create a step", for: .normal)
		createStepButton.addTarget(self, action: #selector(createStepAction), for: .touchUpInside)
		containerView.addSubview(createStepButton)
		
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
			titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
			descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			createStepButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
			createStepButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8.0),
			createStepButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			createStepButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
		])
	}
}
