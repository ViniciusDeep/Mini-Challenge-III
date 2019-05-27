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
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.tableViewColor, NSAttributedString.Key.font: UIFont(name: "AlNile-Bold", size: 40)!]
        navigationController?.navigationBar.barTintColor = Color.navTintBarColor
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
            self.dismiss(animated: true, completion: nil)
            self.createGoal(isStarted: true)
            print("That's ok here")
        }
        
        let createGoalAction = UIAlertAction(title: "Não", style: .cancel)
        {  (_) in
            self.createGoal(isStarted: false)
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(startGoalAction)
        alertController.addAction(createGoalAction)
        present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func createGoal(isStarted: Bool){
        let goalDao = CoreDataDAO<GoalCore>()
        let goal = goalDao.new()
        goal.name = self.goal?.name
        goal.about = self.goal?.description
        goal.isStarted = isStarted
        goal.progress = 0.0
        goalDao.insert(object: goal)
    }
}
