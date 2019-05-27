//
//  DateCollectionViewCell.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 17/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
	var dateLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("fatalError: DateCollectionViewCell")
	}
	
	func setup() {
		dateLabel = UILabel(frame: .zero)
		dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.appFont(with: 22, and: .regular)
		dateLabel.text = "TES"
		addSubview(dateLabel)
		
		NSLayoutConstraint.activate([
			dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
	
	func setContent(_ date: String) {
		dateLabel.text = date
	}
}
