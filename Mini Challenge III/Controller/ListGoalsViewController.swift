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
    
    fileprivate let cellId = "ListID"
    
    var goals = [GoalCore]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setNavigation()
        
        // TEST WITH MOCK DATES IN CORE DATA EXAMPLE TO CREATE STEP IN GOAL
        let goalDao = CoreDataDAO<GoalCore>()
        
        let goal = goalDao.new()
        goal.name = "Test Mock"
        goal.about = "Test Mock About"
        
        let stepDao = CoreDataDAO<StepCore>()
        
        let step = stepDao.new()
        step.name = "First Step"
        step.about = "First About"
        
        goal.addToSteps(step)
        
        goalDao.insert(object: goal)
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        let goalDAO = CoreDataDAO<GoalCore>()
        goals = goalDAO.all()
    }
    
    fileprivate func setCollectionView() {
        collectionView.register(ListGoalViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
    }
    
    fileprivate func setNavigation() {
        let buttomRight = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewGoals))
        let buttonMode = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(changeLayout))
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
        let goal = goals[indexPath.row]
        let coreManager = CoreDataManager()
        
        let steps = coreManager.fetchSteps(from: goal)
        
        steps.forEach { (step) in
            //EXAMPLE WITH FETCH DATES FROM GOAL
            print(step.name!)
        }
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ListGoalViewCell
        cell?.nameGoal.text = goals[indexPath.row].name
        cell?.descriptionGoal.text = goals[indexPath.row].about
        let percentage = goals[indexPath.row].progress
        if percentage != 0  {
            cell?.trackLayer.strokeEnd = CGFloat(percentage)
            cell?.percentageLabel.text = "\(percentage * 100)%"
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 120)
    }
    
    @objc fileprivate func changeLayout() {
        self.collectionView.reloadData()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
}
