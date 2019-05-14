//
//  StepsView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class StepsView: UIView {
	var collectionView: UICollectionView!
	var addStepButton: UIButton!
	var finishProgressButton: RoundedButton!
	
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		let containerView = UIView(frame: .zero)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(containerView)
		
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(width: 170, height: 170)
		flowLayout.minimumInteritemSpacing = 16.0
		flowLayout.scrollDirection = .horizontal
		flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor.clear
//		collectionView.delegate = self
//		collectionView.dataSource = self
		containerView.addSubview(collectionView)
		
		let separateView = UIView(frame: .zero)
		separateView.translatesAutoresizingMaskIntoConstraints = false
		separateView.backgroundColor = UIColor.gray
		containerView.addSubview(separateView)
		
		addStepButton = UIButton(frame: .zero)
		addStepButton.translatesAutoresizingMaskIntoConstraints = false
		addStepButton.setTitle("Add new step", for: .normal)
		addStepButton.setTitleColor(UIColor.blue, for: .normal)
		containerView.addSubview(addStepButton)
		
		finishProgressButton = RoundedButton()
		containerView.addSubview(finishProgressButton)
		
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
			collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
			collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			collectionView.heightAnchor.constraint(equalToConstant: 170.0),
			separateView.heightAnchor.constraint(equalToConstant: 1.0),
			separateView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
			separateView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8.0),
			separateView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
			addStepButton.topAnchor.constraint(equalTo: separateView.bottomAnchor, constant: 2.0),
			addStepButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
			finishProgressButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
			finishProgressButton.topAnchor.constraint(equalTo: addStepButton.bottomAnchor, constant: 8.0),
			finishProgressButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
			finishProgressButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
		])
	}
}
