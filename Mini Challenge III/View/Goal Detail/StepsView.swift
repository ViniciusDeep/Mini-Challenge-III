//
//  StepsView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

protocol StepsViewDelegate: class {
	func createStep()
	func finishMonthProgress()
}

class StepsView: UIView {
	var collectionView: UICollectionView!
	var addStepButton: RoundedButton!
	var finishProgressButton: UIButton!
	
	weak var delegate: StepsViewDelegate?
	var steps: [Step] = []
	
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		
		setup()
		
		let step = Step(name: nil, description: nil, isCompleted: false)
		steps.append(step)
		steps.append(step)
		steps.append(step)
		steps.append(step)
		collectionView.reloadData()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func addStepAction() {
		delegate?.createStep()
	}
	
	@objc func finishMonthProgressAction() {
		delegate?.finishMonthProgress()
	}
	
	func setup() {
		let containerView = UIView(frame: .zero)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(containerView)
		
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(width: 170, height: 167)
		flowLayout.minimumInteritemSpacing = 16.0
		flowLayout.scrollDirection = .horizontal
		flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor.clear
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(StepCollectionViewCell.self, forCellWithReuseIdentifier: "StepCollectionViewCell")
		containerView.addSubview(collectionView)
		
		let separateView = UIView(frame: .zero)
		separateView.translatesAutoresizingMaskIntoConstraints = false
		separateView.backgroundColor = UIColor.gray
		containerView.addSubview(separateView)
		
		addStepButton = RoundedButton()
		addStepButton.setTitle("Create Step", for: .normal)
		addStepButton.addTarget(self, action: #selector(addStepAction), for: .touchUpInside)
		containerView.addSubview(addStepButton)
		
		finishProgressButton = UIButton(frame: .zero)
		finishProgressButton.translatesAutoresizingMaskIntoConstraints = false
		finishProgressButton.setTitle("Finish month progress", for: .normal)
		finishProgressButton.setTitleColor(.buttonColor, for: .normal)
		finishProgressButton.addTarget(self, action: #selector(finishMonthProgressAction), for: .touchUpInside)
		containerView.addSubview(finishProgressButton)
		
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
			collectionView.heightAnchor.constraint(equalToConstant: 167.0),
			collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
			collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			separateView.heightAnchor.constraint(equalToConstant: 1.0),
			separateView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			separateView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16.0),
			separateView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
			addStepButton.widthAnchor.constraint(equalToConstant: 150.0),
			addStepButton.topAnchor.constraint(equalTo: separateView.bottomAnchor, constant: 16.0),
			addStepButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
			finishProgressButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
			finishProgressButton.topAnchor.constraint(equalTo: addStepButton.bottomAnchor, constant: 16.0),
			finishProgressButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			finishProgressButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
		])
	}
	
	func reloadData() {
		collectionView.reloadData()
	}
}

extension StepsView: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return steps.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StepCollectionViewCell", for: indexPath) as? StepCollectionViewCell else { return UICollectionViewCell() }
		
		cell.setContent()
		return cell
	}
}
