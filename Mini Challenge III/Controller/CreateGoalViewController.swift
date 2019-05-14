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
    fileprivate var count = 0
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    fileprivate lazy var nextButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(changeContent), for: .touchUpInside)
        button.setImage(UIImage(named: "nextstep"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate var goalfields = [GoalField(name: "What is the name of your goal?", placeHolder: "Ex: Travel to France"), GoalField(name: "Specific your goal!", placeHolder: "Ex: Plan and execute five customer education webinars this quarter with 15-plus attendees per event and 80% or higher "), GoalField(name: "How you make this?", placeHolder: "Ex: Save money every day"), GoalField(name: "When?", placeHolder: "Ex: May in the next month")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationItems()
        buildViewHierarchy()
        setupTableView()
    }
    
    fileprivate func setNavigationItems() {
        navigationItem.title = "Create Your Goal"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addNewGoal))
    }
    fileprivate func buildViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(nextButton)
        view.addSubview(progressStepView)
        setConstraints()
    }
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: progressStepView.bottomAnchor, constant: 60),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            progressStepView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            progressStepView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            progressStepView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/2) - 200),
            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    @objc fileprivate func backToController() {
        dismiss(animated: true, completion: nil)
    }
}
extension CreateGoalViewController {
    @objc func changeContent(sender: UIButton) {
            progressStepView.verifyCurrentStep(currentStep: 2)
    }
}
extension CreateGoalViewController: UITableViewDelegate, UITableViewDataSource {
    fileprivate func setupTableView() {
        tableView.register(CreateGoalsViewCell.self, forCellReuseIdentifier: cellId)
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CreateGoalsViewCell
        cell?.contentText.text = goalfields[indexPath.row].name
        cell?.contextTf.placeholder = goalfields[indexPath.row].placeHolder
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc fileprivate func addNewGoal() {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? CreateGoalsViewCell
        guard let textField = cell?.contextTf.text else {return}
        ListGoalsViewController.goals.append(Goal(name:  "Nova Meta", description: "Teste de nova meta", how: textField, when:  textField, progress: 0.9))
        dismiss(animated: true, completion: nil)
    }
}
