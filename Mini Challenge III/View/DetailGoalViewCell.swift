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
        setComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setComponents() {
        addSubview(checkButton)
        addSubview(nameGoal)
        checkButton.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2).isActive = true
         checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        nameGoal.topAnchor.constraint(equalTo: checkButton.centerYAnchor).isActive = true
        
        nameGoal.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10).isActive = true
    }
}
