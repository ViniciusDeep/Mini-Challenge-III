//
//  CreateStepViewController.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 20/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateStepViewController: UIViewController {
	var createStepView: CreateStepView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	func setup() {
		createStepView = CreateStepView()
		view.addSubview(createStepView)
		
		NSLayoutConstraint.activate([
			createStepView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			createStepView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			createStepView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
