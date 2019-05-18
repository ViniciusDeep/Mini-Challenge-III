//
//  CalendarView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CalendarView: UIView {
	var collectionView: UICollectionView!
	
	let dates = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
	
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = UIColor.white
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(width: 52, height: 33)
		flowLayout.minimumInteritemSpacing = 16.0
		flowLayout.scrollDirection = .horizontal
		flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor.white
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(DateCollectionViewCell.self, forCellWithReuseIdentifier: "DateCollectionViewCell")
		addSubview(collectionView)
		heightAnchor.constraint(equalToConstant: 54.0).isActive = true
		
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dates.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as? DateCollectionViewCell else { return UICollectionViewCell() }
		
		let date = dates[indexPath.item]
		cell.setContent(date)
		
		return cell
	}
}
