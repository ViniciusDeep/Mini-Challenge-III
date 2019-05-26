//
//  CreateStepView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 20/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

protocol CreateStepViewDelegate: class {
	func createStep()
}

class CreateStepView: UIView{
	var dismissView: DismissView!
	var newStepLabel: UILabel!
	var stepNameLabel: UILabel!
	var stepNameTextField: UITextField!
	var stepDescriptionLabel: UILabel!
	var stepDescriptionTextField: UITextField!
	var createButton: RoundedButton!
	
	weak var delegate: CreateStepViewDelegate?
	
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = UIColor.clear
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("fatalError: CreateStepView")
	}
	
	@objc func createStepAction() {
		delegate?.createStep()
	}
	
	func setup() {
		dismissView = DismissView()
		addSubview(dismissView)
		
		let containerView = UIView(frame: .zero)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		containerView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
		addSubview(containerView)
		
		newStepLabel = UILabel(frame: .zero)
		newStepLabel.translatesAutoresizingMaskIntoConstraints = false
		newStepLabel.text = "New step"
        newStepLabel.font = UIFont.boldSystemFont(ofSize: 20)
		newStepLabel.textAlignment = .center
		containerView.addSubview(newStepLabel)
		
		stepNameLabel = UILabel(frame: .zero)
		stepNameLabel.translatesAutoresizingMaskIntoConstraints = false
		stepNameLabel.text = "Step name"
		stepNameLabel.textAlignment = .left
		containerView.addSubview(stepNameLabel)
		
		stepNameTextField = UITextField(frame: .zero)
		stepNameTextField.translatesAutoresizingMaskIntoConstraints = false
		stepNameTextField.placeholder = "Write a name for the step"
		containerView.addSubview(stepNameTextField)
		
		let firsSeparatorView = UIView(frame: .zero)
		firsSeparatorView.translatesAutoresizingMaskIntoConstraints = false
		firsSeparatorView.backgroundColor = UIColor.gray
		containerView.addSubview(firsSeparatorView)
		
		stepDescriptionLabel = UILabel(frame: .zero)
		stepDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		stepDescriptionLabel.text = "Step description"
		stepDescriptionLabel.textAlignment = .left
		containerView.addSubview(stepDescriptionLabel)
		
		stepDescriptionTextField = UITextField(frame: .zero)
		stepDescriptionTextField.translatesAutoresizingMaskIntoConstraints = false
		stepDescriptionTextField.placeholder = "Write a description for the step"
		containerView.addSubview(stepDescriptionTextField)
		
		let secondSeparatorView = UIView(frame: .zero)
		secondSeparatorView.translatesAutoresizingMaskIntoConstraints = false
		secondSeparatorView.backgroundColor = UIColor.gray
		containerView.addSubview(secondSeparatorView)
		
		createButton = RoundedButton()
		createButton.setTitle("Create", for: .normal)
		createButton.addTarget(self, action: #selector(createStepAction), for: .touchUpInside)
		containerView.addSubview(createButton)
		
		NSLayoutConstraint.activate([
			heightAnchor.constraint(equalToConstant: 570.0),
			dismissView.leadingAnchor.constraint(equalTo: leadingAnchor),
			dismissView.topAnchor.constraint(equalTo: topAnchor),
			dismissView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.topAnchor.constraint(equalTo: dismissView.bottomAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			newStepLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			newStepLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16.0),
			newStepLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			stepNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			stepNameLabel.topAnchor.constraint(equalTo: newStepLabel.bottomAnchor, constant: 8.0),
			stepNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			stepNameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			stepNameTextField.topAnchor.constraint(equalTo: stepNameLabel.bottomAnchor, constant: 8.0),
			stepNameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			firsSeparatorView.heightAnchor.constraint(equalToConstant: 2.0),
			firsSeparatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			firsSeparatorView.topAnchor.constraint(equalTo: stepNameTextField.bottomAnchor, constant: 8.0),
			firsSeparatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			stepDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			stepDescriptionLabel.topAnchor.constraint(equalTo: firsSeparatorView.bottomAnchor, constant: 8.0),
			stepDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			stepDescriptionTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			stepDescriptionTextField.topAnchor.constraint(equalTo: stepDescriptionLabel.bottomAnchor, constant: 8.0),
			stepDescriptionTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			secondSeparatorView.heightAnchor.constraint(equalToConstant: 2.0),
			secondSeparatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			secondSeparatorView.topAnchor.constraint(equalTo: stepDescriptionTextField.bottomAnchor, constant: 8.0),
			secondSeparatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			createButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			createButton.topAnchor.constraint(equalTo: secondSeparatorView.bottomAnchor, constant: 32.0),
			createButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0)
		])
	}
}
