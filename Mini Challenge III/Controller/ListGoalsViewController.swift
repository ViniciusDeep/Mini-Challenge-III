//
//  ListGoalsViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListGoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let cellId = "ListID"
    
    
    public var goals = [Goal(name: "Viagem", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã",progress: 0),
                        Goal(name: "Namoro", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 1),
                        Goal(name: "Vida", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0),
                        Goal(name: "Codar", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0.8),
                        Goal(name: "Amor", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0.7),
                        Goal(name: "Ter metas", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0.5),
                        Goal(name: "Hiate", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 1)
                        ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavigation()
    }
    
    fileprivate func setTableView() {
        view.addSubview(tableView)
        tableView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        tableView.register(ListGoalViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setNavigation() {
        let buttomRight = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewGoals))
        navigationItem.rightBarButtonItem = buttomRight
    }
    
    @objc fileprivate func addNewGoals() {
        let createVC = CreateGoalViewController()
        let navController = UINavigationController(rootViewController: createVC)
        present(navController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailGoalViewController()
        detailVC.goal = goals[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ListGoalViewCell
        cell?.nameGoal.text = goals[indexPath.row].name
        let percentage = goals[indexPath.row].progress
        if percentage != 0  {
            cell?.trackLayer.strokeEnd = percentage
            cell?.percentageLabel.text = "\(percentage * 100)%"
        }
        return cell ?? UITableViewCell()
    }
}
