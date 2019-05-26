//
//  DetailGoalViewCell.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DetailGoalViewCell: UITableViewCell, ConfigurableView {
   
    lazy var checkButton = UIButton(imageNamed: "uncheck")
  
    let nameGoal = UILabel(text: "Esse é meu primeiro passo", sizeFont: 14)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        self.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        addSubview(checkButton)
        addSubview(nameGoal)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            checkButton.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2),
            checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameGoal.topAnchor.constraint(equalTo: checkButton.centerYAnchor),
            nameGoal.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10)
            ])
    }
}

class DetailGoalCollectionViewCell: UICollectionViewCell {
    
    lazy var checkButton = UIButton(imageNamed: "uncheck")
    
    let nameGoal = UILabel(text: "Esse é meu primeiro passo", sizeFont: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func buidViewHierarchy() {
        addSubview(checkButton)
        addSubview(nameGoal)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            checkButton.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2),
            checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameGoal.topAnchor.constraint(equalTo: checkButton.centerYAnchor),
            nameGoal.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10)
            ])
    }
}
