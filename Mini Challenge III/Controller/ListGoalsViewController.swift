//
//  ListGoalsViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import UIKit
import CoreData

class ListGoalsViewController: BaseListController {
    var goals = [GoalCore]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .backgroundColor
        collectionView.reloadData()
        setupNavigation()
        self.collectionView.reloadData()
        let goalDAO = CoreDataDAO<GoalCore>()
        goals = goalDAO.all()
    }
    fileprivate func setupCollectionView() {
        self.collectionView.register(cellType: ListGoalViewCell.self)
        collectionView.backgroundColor = .clear
    }
    
    fileprivate func setupNavigation() {
        let buttomRight = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewGoals))
        navigationController?.navigationBar.barTintColor = .navBarBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Goals"
        buttomRight.tintColor = .white
        navigationItem.rightBarButtonItems = [buttomRight]
    }
    
    @objc fileprivate func addNewGoals() {
        let createVC = CreateGoalViewController()
        let navController = UINavigationController(rootViewController: createVC)
        present(navController, animated: true, completion: nil)
    }
}

extension ListGoalsViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goal = goals[indexPath.row]
        let detailVC = DetailGoalViewController(with: goal)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ListGoalViewCell.self) 
        cell.nameGoal.text = goals[indexPath.row].name
        cell.descriptionGoal.text = goals[indexPath.row].about
        
        guard let steps = goals[indexPath.row].steps.allObjects as? [StepCore] else {return UICollectionViewCell()}
       let percentage = GoalHelper.getCurrenceProgress(steps: steps)
        if steps.isEmpty {
            cell.trackLayer.strokeEnd = CGFloat(percentage)
            cell.percentageLabel.text = "\(0.0)%"
        } else if  goals[indexPath.row].isStarted {
            cell.trackLayer.strokeEnd = CGFloat(percentage/100)
            cell.percentageLabel.text = "\(String(format: "%.0f%", percentage))%"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 120)
    }
}
