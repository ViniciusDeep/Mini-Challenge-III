//
//  GoalHeaderView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 14/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import UIKit

class GoalHeaderView: UIView {
    var progressView: CircularProgressView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
    init(with goal: GoalCore) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        
        setup(goal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("faltal error GoalHeaderView")
    }
    
    func setup(_ goal: GoalCore) {
        if goal.isStarted {
            //            progressView = CircularProgressView(goalProgress: goal.progress)
        } else {
            progressView = CircularProgressView(goalProgress: nil)
        }
        addSubview(progressView)
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "A title"
        addSubview(titleLabel)
        
        descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = "A bigger description"
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 147.0),
            progressView.topAnchor.constraint(equalTo: topAnchor),
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            titleLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 8.0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0)
            ])
    }
    
    func startProgress() {
        progressView.isCenterLabelStarted(true)
    }
}
