//
//  CreateGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGoalViewController: UITableViewController {
    
    let cellId: String = "cellId"
    
    var goal: Goal?
    
    fileprivate var goalfields = [GoalField(name: "What is the name of your goal?", placeHolder: "Ex: Travel to France"), GoalField(name: "Specific your goal!", placeHolder: "Ex: Plan and execute five customer education webinars this quarter with 15-plus attendees per event and 80% or higher "), GoalField(name: "How you make this?", placeHolder: "Ex: Save money every day"), GoalField(name: "When?", placeHolder: "Ex: May in the next month")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.allowsSelection = false
        setNavigationItems()
        tableView.register(CreateGoalsViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setNavigationItems() {
        navigationItem.title = "Create Your Goal"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addNewGoal))
    }
    
    @objc fileprivate func backToController() {
        dismiss(animated: true, completion: nil)
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CreateGoalsViewCell
        cell?.contentText.text = goalfields[indexPath.row].name
        cell?.contextTf.placeholder = goalfields[indexPath.row].placeHolder
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalfields.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc fileprivate func addNewGoal() {
        dismiss(animated: true, completion: nil)
    }
    
}
