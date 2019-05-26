//
//  ProgressView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 08/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ProgressStepView: UIView {
    
    lazy var firstStep = UIImageView(imagedNamed: "firststep")
    
    lazy var firstLineView = UIImageView(imagedNamed: "line")
    
    lazy var secondStep = UIImageView(imagedNamed: "secondstep")
    
    lazy var thirdStep = UIImageView(imagedNamed: "thirdstep")

    lazy var secondLineView = UIImageView(imagedNamed: "line")
    
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
              firstLineView.topAnchor.constraint(equalTo: firstStep.topAnchor, constant: 10),
              secondStep.topAnchor.constraint(equalTo: firstStep.topAnchor),
              secondStep.leadingAnchor.constraint(equalTo: firstLineView.trailingAnchor, constant: -5),
              secondLineView.leadingAnchor.constraint(equalTo: secondStep.trailingAnchor, constant: -5),
              secondLineView.topAnchor.constraint(equalTo: firstStep.topAnchor, constant: 10),
              thirdStep.topAnchor.constraint(equalTo: self.topAnchor),
              thirdStep.leadingAnchor.constraint(equalTo: secondLineView.trailingAnchor)
            ])
    }
    public func verifyCurrentStep(currentStep: Int) {
        switch currentStep {
        case 1:
            firstStep.image = UIImage(named: "firststepchecked")
            firstLineView.image = UIImage(named: "lineCheck")
            self.firstStep.image = UIImage(named: "firststep")
            self.firstLineView.image = UIImage(named: "line")
            self.secondStep.image = UIImage(named: "secondstep")
            self.secondLineView.image = UIImage(named: "lineCheck")
            self.thirdStep.image = UIImage(named: "thirdstep")
        case 2:
            firstStep.image = UIImage(named: "firststepchecked")
            firstLineView.image = UIImage(named: "lineCheck")
            secondStep.image = UIImage(named: "secondstepchecked")
            self.secondLineView.image = UIImage(named: "line")
            self.thirdStep.image = UIImage(named: "thirdstep")
        case 3:
                self.firstStep.image = UIImage(named: "firststepchecked")
                self.firstLineView.image = UIImage(named: "lineCheck")
                self.secondStep.image = UIImage(named: "secondstepchecked")
                self.secondLineView.image = UIImage(named: "lineCheck")
                self.thirdStep.image = UIImage(named: "thirdstepchecked")
            
        default:
            break
        }
    }
}
