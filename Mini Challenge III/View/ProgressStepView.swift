//
//  ProgressView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 08/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit


class ProgressStepView: UIView {
    
    lazy var firstStep: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "firststep"))
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    lazy var secondStep: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "secondstep"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var thirdStep: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "thirdstep"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var firstLineView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "line"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var secondLineView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "line"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

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
            break
        case 2:
            break
        case 3:
            break
        default:
            break
        }
    }
}
