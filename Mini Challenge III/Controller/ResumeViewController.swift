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
        setupResumeView()
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
    
    fileprivate func setupResumeView() {
        resumeView.createButton.addTarget(nil, action: #selector(createFinishGoal), for: .touchUpInside)
    }
    
    @objc fileprivate func createFinishGoal() {
        let alertController = UIAlertController(title: "Deseja iniciar a meta?", message: "Sua meta ainda não foi iniciada, você deseja iniciá-la?", preferredStyle: .alert)
        
        let startGoalAction = UIAlertAction(title: "Sim", style: .default) { (_) in
            //code over here to create your goal, this settings of core here
            self.dismiss(animated: true, completion: nil)
            print("That's ok here")
        }
        
        let createGoalAction = UIAlertAction(title: "Não", style: .cancel)
        {  (_) in
            //this code is to create your without start
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(startGoalAction)
        alertController.addAction(createGoalAction)
        
        
        present(alertController, animated: true, completion: nil)
    }
}
