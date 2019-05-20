//
//  SquareListGoalCell.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 07/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class SquareListGoalCell: UICollectionViewCell {
    lazy var nameGoal: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var descriptionGoal: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var trackLayer: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeEnd = 0
        trackLayer.strokeColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).cgColor
        trackLayer.lineWidth = 3
        trackLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        return trackLayer
    }()
    fileprivate lazy var trackLayerGray: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeEnd = 1
        trackLayer.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        trackLayer.lineWidth = 3
        trackLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        trackLayer.opacity = 0.4
        return trackLayer
    }()
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        buidViewHierarchy()
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 8
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func buidViewHierarchy() {
        layer.addSublayer(trackLayer)
        layer.addSublayer(trackLayerGray)
        addSubview(nameGoal)
        addSubview(percentageLabel)
        addSubview(descriptionGoal)
        setupConstraints()
    }
    fileprivate func setupConstraints() {
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = CGPoint(x: 50, y: 50)
        NSLayoutConstraint.activate([
           nameGoal.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            nameGoal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionGoal.topAnchor.constraint(equalTo: nameGoal.bottomAnchor, constant: 10),
            descriptionGoal.leadingAnchor.constraint(equalTo: nameGoal.leadingAnchor)
            ])
    }
}
