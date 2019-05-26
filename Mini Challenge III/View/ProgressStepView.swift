//
//  ProgressView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 08/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ProgressStepView: UIView {
    
    lazy var firstStep = UIImageView(imagedNamed: "firststep", highlightedImageNamed: "firststepchecked")
    
    lazy var firstLineView = UIImageView(imagedNamed: "line", highlightedImageNamed: "linecheck")
    
    lazy var secondStep = UIImageView(imagedNamed: "secondstep", highlightedImageNamed: "secondstepchecked")
    
    lazy var thirdStep = UIImageView(imagedNamed: "thirdstep", highlightedImageNamed: "thirdstepchecked")

    lazy var secondLineView = UIImageView(imagedNamed: "line", highlightedImageNamed: "linecheck")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func buildViewHierarchy() {
        addSubview(firstStep)
        addSubview(secondStep)
        addSubview(thirdStep)
        addSubview(firstLineView)
        addSubview(secondLineView)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
              firstStep.leadingAnchor.constraint(equalTo: self.leadingAnchor),
              firstStep.topAnchor.constraint(equalTo: self.topAnchor),
              firstLineView.leadingAnchor.constraint(equalTo: firstStep.trailingAnchor,constant: -5),
              firstLineView.topAnchor.constraint(equalTo: firstStep.topAnchor, constant: 15),
              secondStep.topAnchor.constraint(equalTo: firstStep.topAnchor),
              secondStep.leadingAnchor.constraint(equalTo: firstLineView.trailingAnchor, constant: -5),
              secondLineView.leadingAnchor.constraint(equalTo: secondStep.trailingAnchor, constant: -5),
              secondLineView.topAnchor.constraint(equalTo: firstStep.topAnchor, constant: 15),
              thirdStep.topAnchor.constraint(equalTo: self.topAnchor),
              thirdStep.leadingAnchor.constraint(equalTo: secondLineView.trailingAnchor)
            ])
    }
    public func verifyCurrentStep(currentStep: Int) {
        switch currentStep {
        case 1:
            setHighlightedSteps(false, false, false, false, false)
        case 2:
            setHighlightedSteps(true, true, false, false, false)
            
        case 3:
            setHighlightedSteps(true, true, true, true, false)
        default:
            setHighlightedSteps(false, false, false, false, false)
        }
    }
    
    fileprivate func setHighlightedSteps(_ firstStep: Bool, _ firstLine: Bool, _ secondStep: Bool, _ secondLine: Bool,_ thirdStep: Bool) {
        self.firstStep.isHighlighted = firstStep
        self.firstLineView.isHighlighted = firstLine
        self.secondStep.isHighlighted = secondStep
        self.secondLineView.isHighlighted = secondLine
        self.thirdStep.isHighlighted = thirdStep
    }
}
