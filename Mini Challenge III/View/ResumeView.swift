//
//  ResumeView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 09/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ResumeView: UIView {
    
    lazy var goalLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()

    lazy var howLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var whatINeed: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var when: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func buildViewHierarchy() {
        addSubview(goalLabel)
        addSubview(howLabel)
        addSubview(when)
        addSubview(whatINeed)
        setConstraints()
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            goalLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            goalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            goalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 100),
            goalLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: (self.frame.height/2) - 100)
            ])
    }
}
