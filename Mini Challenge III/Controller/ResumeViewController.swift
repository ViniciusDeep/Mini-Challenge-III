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
    
    var goal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupResumeView()
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AlNile-Bold", size: 40)!]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2823529412, green: 0.4745098039, blue: 0.8431372549, alpha: 1)
        navigationItem.title = "Resume"
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
    
    func setPropertieToGoalInView(goal: Goal) {
        resumeView.goalDescription.text = goal.name
        resumeView.goalHow.text = goal.how
        resumeView.goalNeeds.text = goal.description
        resumeView.goalWhen.text = goal.when
    }
    
    @objc fileprivate func createFinishGoal() {
        let alertController = UIAlertController(title: "Deseja iniciar a meta?", message: "Sua meta ainda não foi iniciada, você deseja iniciá-la?", preferredStyle: .alert)
        
        let startGoalAction = UIAlertAction(title: "Sim", style: .default) { (_) in
            let goalDao = CoreDataDAO<GoalCore>()
            
            let goal = goalDao.new()
            goal.name = self.goal?.name
            goal.about = self.goal?.description
            goal.isStarted = true
            goal.progress = 0.0
            
            goalDao.insert(object: goal)
            
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
