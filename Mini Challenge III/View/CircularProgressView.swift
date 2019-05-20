//
//  CircularProgressView.swift
//  Mini Challenge III
//
//  Created by Guilherme Colombini on 14/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {
	var trackLayer: CAShapeLayer!
	var trackLayerGray: CAShapeLayer!
	var centerLabel: UILabel!
	
	init(goalProgress: CGFloat?) {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		
		setup()
		
		if let progress = goalProgress {
			isCenterLabelStarted(true)
			centerLabel.text = String(format: "%.0f%", progress)
		} else {
			isCenterLabelStarted(false)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("fatal error CircularProgressView")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		updateShapeLayer()
	}
	
	func setup() {
		trackLayer = CAShapeLayer()
		trackLayer.strokeColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).cgColor
		trackLayer.lineWidth = 3
		trackLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		layer.addSublayer(trackLayer)
		
		trackLayerGray = CAShapeLayer()
		trackLayerGray.strokeEnd = 1
		trackLayerGray.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
		trackLayerGray.lineWidth = 3
		trackLayerGray.opacity = 0.3
		trackLayerGray.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		layer.addSublayer(trackLayerGray)
		
		centerLabel = UILabel(frame: .zero)
		centerLabel.translatesAutoresizingMaskIntoConstraints = false
		centerLabel.textAlignment = .center
		centerLabel.numberOfLines = 2
		addSubview(centerLabel)
		
		NSLayoutConstraint.activate([
			widthAnchor.constraint(equalToConstant: 91),
			heightAnchor.constraint(equalToConstant: 91),
			centerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			centerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			centerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			centerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
		
		updateShapeLayer()
	}
	
	func updateShapeLayer() {
		let circularPath = UIBezierPath(arcCenter: centerLabel.center, radius: 44.5, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
		trackLayer.path = circularPath.cgPath
		trackLayerGray.path = circularPath.cgPath
	}
	
	func isCenterLabelStarted(_ bool: Bool) {
		if bool {
			centerLabel.font = UIFont.boldSystemFont(ofSize: 28)
			centerLabel.text = "0%"
		} else {
			centerLabel.font = UIFont.systemFont(ofSize: 14.0)
			centerLabel.text = "Aguardando inicio"
		}
	}
}
