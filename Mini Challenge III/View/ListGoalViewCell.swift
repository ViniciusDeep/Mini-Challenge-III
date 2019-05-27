//
//  ListGoalViewCell.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 05/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListGoalViewCell: UICollectionViewCell, ConfigurableView, Reusable {
    lazy var nameGoal = UILabel(text: "Name of Goal", sizeFont: 18)
    
    lazy var descriptionGoal = UILabel(text: "Description", textColor: .textsColor)
    
    lazy var trackLayer: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.speed = 0.5
        trackLayer.strokeStart = 0
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.trackLayerColor.cgColor
        trackLayer.lineWidth = 3
        trackLayer.fillColor = UIColor.tableViewColor.cgColor
        return trackLayer
    }()
    
    fileprivate lazy var trackLayerGray: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeEnd = 1
        trackLayer.strokeColor = UIColor.textsColor.cgColor
        trackLayer.lineWidth = 3
        trackLayer.fillColor = UIColor.tableViewColor.cgColor
        trackLayer.opacity = 0.4
        return trackLayer
    }()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textColor = Color.textsColor
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        nameGoal.textColor = .textsColor
        descriptionGoal.textColor = .textsColor
        self.backgroundColor = .tableViewColor
        self.layer.cornerRadius = 8
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        layer.addSublayer(trackLayer)
        layer.addSublayer(trackLayerGray)
        addSubview(nameGoal)
        addSubview(percentageLabel)
        addSubview(descriptionGoal)
        setupConstraints()
    }
    func setupConstraints() {
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = CGPoint(x: 50, y: 50)
         NSLayoutConstraint.activate([
            nameGoal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            nameGoal.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameGoal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            descriptionGoal.leadingAnchor.constraint(equalTo: nameGoal.leadingAnchor),
            descriptionGoal.topAnchor.constraint(equalTo: nameGoal.bottomAnchor, constant: 10),
            descriptionGoal.trailingAnchor.constraint(equalTo: self.nameGoal.trailingAnchor)
            ])
    }
}
