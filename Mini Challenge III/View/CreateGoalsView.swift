//
//  CreateGoalsView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGoalsViewCell: UITableViewCell {
    
    lazy var contentText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var contextTf: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setComponents()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setComponents() {
        addSubview(contentText)
        addSubview(contextTf)
        
        contentText.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        contentText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        contextTf.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contextTf.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
    }
}
