//
//  CreateGoalsView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGoalsView: UIView {
    
    lazy var textDescription: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "First specific your goals"
       label.font = UIFont.boldSystemFont(ofSize: 24)
       label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setComponents()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setComponents() {
        addSubview(textDescription)
        guard let superView = superview else {return}
        
       textDescription.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        textDescription.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
}
