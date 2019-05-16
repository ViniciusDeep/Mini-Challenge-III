//
//  ResumeViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 09/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {
    
    lazy var resumeView = ResumeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
    }
    
    fileprivate func buildViewHierarchy() {
        view.addSubview(resumeView)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
              resumeView.topAnchor.constraint(equalTo: self.view.topAnchor),
              resumeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
              resumeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
              resumeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
    }
}
