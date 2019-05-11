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
        setConstraints()
    }
    
    fileprivate func setConstraints() {
    }
}
