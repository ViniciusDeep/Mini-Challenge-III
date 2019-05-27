//
//  ListGoalViewCell.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 05/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListGoalViewCell: UICollectionViewCell, ConfigurableView, Reusable {
    
    private weak var shadowView: UIView?

    lazy var customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy var nameGoal: UILabel = {
        let label = UILabel(text: "Name of Goal")
        if let font = UIFont.appFont(with: 18, and: .extraBold) {
            label.font = font
        }
        label.textAlignment = .left
        return label
    }()
    
    lazy var descriptionGoal: UILabel = {
        let label = UILabel(text: "Description")
        if let font = UIFont.appFont(with: 16, and: .regular) {
            label.font = font
        }
        label.textAlignment = .left
        return label
    }()

    lazy var trackLayer: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.speed = 0.5
        trackLayer.strokeStart = 0
        trackLayer.path = circularPath.cgPath
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
        label.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        buildViewHierarchy()
        nameGoal.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        descriptionGoal.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 8
    }
    
    func buildViewHierarchy() {
        addSubview(customView)
        customView.layer.addSublayer(trackLayer)
        customView.layer.addSublayer(trackLayerGray)
        customView.addSubview(nameGoal)
        customView.addSubview(percentageLabel)
        customView.addSubview(descriptionGoal)
        setupConstraints()
    }
    func setupConstraints() {
        customView.fillSuperview()
        
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = CGPoint(x: 50, y: 50)
         NSLayoutConstraint.activate([
            nameGoal.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 100),
            nameGoal.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10),
            nameGoal.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
            descriptionGoal.leadingAnchor.constraint(equalTo: nameGoal.leadingAnchor),
            descriptionGoal.topAnchor.constraint(equalTo: nameGoal.bottomAnchor, constant: 10),
            descriptionGoal.trailingAnchor.constraint(equalTo: self.nameGoal.trailingAnchor)
            ])
    }
    
    private func configureShadow(){
        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width + 5 , height: bounds.height + 5))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView
        self.applyShadow(width: CGFloat(0), height: CGFloat(0))
    }
    
    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView = shadowView{
            let shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 10)
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowRadius = 3
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: width, height: height)
            shadowView.layer.shadowOpacity = 0.15
            shadowView.layer.shadowPath = shadowPath.cgPath
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureShadow()
    }
}
