//
//  CreateGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController {
    
    let cellId: String = "cellId"
    
    var goal: Goal?
    
    fileprivate lazy var progressStepView = ProgressStepView()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    fileprivate var goalfields = [GoalField(name: "What is the name of your goal?", placeHolder: "Ex: Travel to France"), GoalField(name: "Specific your goal!", placeHolder: "Ex: Plan and execute five customer education webinars this quarter with 15-plus attendees per event and 80% or higher "), GoalField(name: "How you make this?", placeHolder: "Ex: Save money every day"), GoalField(name: "When?", placeHolder: "Ex: May in the next month")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationItems()
        setupProgressView()
        setupTableView()
    }
    
    fileprivate func setNavigationItems() {
        navigationItem.title = "Create Your Goal"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addNewGoal))
    }
    
    fileprivate func setupProgressView() {
        view.addSubview(progressStepView)
        NSLayoutConstraint.activate([
            progressStepView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            progressStepView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85),
            progressStepView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/2) - 200)
            ])
    }
    
    
    @objc fileprivate func backToController() {
        dismiss(animated: true, completion: nil)
    }
   
}

extension CreateGoalViewController: UITableViewDelegate, UITableViewDataSource {
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.register(CreateGoalsViewCell.self, forCellReuseIdentifier: cellId)
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        
        tableView.topAnchor.constraint(equalTo: progressStepView.bottomAnchor, constant: 60).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
     //  tableView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CreateGoalsViewCell
        cell?.contentText.text = goalfields[indexPath.row].name
        cell?.contextTf.placeholder = goalfields[indexPath.row].placeHolder
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalfields.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc fileprivate func addNewGoal() {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? CreateGoalsViewCell
        guard let textField = cell?.contextTf.text else {return}
        let listGoalsVc = ListGoalsViewController()
        listGoalsVc.goals.append(Goal(name:  textField, description:  textField, how:  textField, when:  textField, progress: 0.0))
        listGoalsVc.collectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
 
