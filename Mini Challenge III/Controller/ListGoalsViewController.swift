//
//  ListGoalsViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListGoalsViewController: BaseListController {
    
    fileprivate let cellId = "ListID"
    
    public static var goals = [Goal(name: "Viagem", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã",progress: 0.9),
                        Goal(name: "Namoro", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 1),
                        Goal(name: "Vida", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0.6),
                        Goal(name: "Codar", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0.8),
                        Goal(name: "Amor", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0.7),
                        Goal(name: "Ter metas", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 0.5),
                        Goal(name: "Hiate", description: "Ir para uma viagem com minha família", how: "Ainda não sei", when: "Amanhã", progress: 1)
                        ]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    fileprivate func setCollectionView() {
        collectionView.register(ListGoalViewCell.self, forCellWithReuseIdentifier: cellId)
         collectionView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
    }
    
    fileprivate func setNavigation() {
        let buttomRight = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewGoals))
        let buttonMode = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        navigationItem.rightBarButtonItems = [buttomRight, buttonMode]
    }
    
    @objc fileprivate func addNewGoals() {
        let createVC = CreateGoalViewController()
        let navController = UINavigationController(rootViewController: createVC)
        present(navController, animated: true, completion: nil)
    }
}

extension ListGoalsViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let goal = ListGoalsViewController.goals[indexPath.row]
        let detailVC = DetailGoalViewController(with: goal)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ListGoalsViewController.goals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ListGoalViewCell
        cell?.nameGoal.text = ListGoalsViewController.goals[indexPath.row].name
        cell?.descriptionGoal.text = ListGoalsViewController.goals[indexPath.row].description
        let percentage = ListGoalsViewController.goals[indexPath.row].progress
        if percentage != 0  {
            cell?.trackLayer.strokeEnd = percentage
            cell?.percentageLabel.text = "\(percentage * 100)%"
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 120)
    }

}
