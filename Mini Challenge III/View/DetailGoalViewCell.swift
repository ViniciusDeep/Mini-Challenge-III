//
//  DetailGoalViewCell.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DetailGoalViewCell: UITableViewCell {
   
    lazy var checkButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       button.setImage(UIImage(named: "uncheck"), for: .normal)
       return button
    }()
    
    lazy var nameGoal: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Esse é meu primeiro passo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buidViewHierarchy()
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


class DetailGoalCollectionViewCell: UICollectionViewCell {
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "uncheck"), for: .normal)
        return button
    }()
    
    lazy var nameGoal: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Esse é meu primeiro passo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
