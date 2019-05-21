//
//  DetailGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import UIKit

class DetailGoalViewController: UIViewController {
    var headerView: GoalHeaderView!
    lazy var calendarView: CalendarView = {
        let view = CalendarView()
        return view
    }()
    lazy var stepsView: StepsView = {
        let view = StepsView()
        return view
    }()
    lazy var haventStartedView: GoalHaventStartedView = {
        let view = GoalHaventStartedView()
        return view
    }()
    lazy var withouStepsView: WithoutStepsStateView = {
        let view = WithoutStepsStateView()
        return view
    }()
    
    public var goal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigation()
    }
    
    convenience init(with goal: GoalCore) {
        self.init()
        
        setupHeaderView(goal)
        
        
        
        
        //        setupCalendar()
        //        setupSteps()
        
        //verifing state
        //        if (goal.isStarted) {
        //            let stepDAO = CoreDataDAO<StepCore>()
        //            let steps = stepDAO.all()
        //
        //            steps.forEach { (step) in
        //                print(step)
        //            }
        //
        //            if (goal.steps.count != 0) {
        //
        //            }
        //            else {
        //
        //            }
        //        }
        //        else {
        //            setupNotStartedState()
        //        }
    }
    
    func setupHeaderView(_ goal: GoalCore) {
        headerView = GoalHeaderView(with: goal)
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func setupNotStartedState() {
        view.addSubview(haventStartedView)
        haventStartedView.delegate = self
        
        NSLayoutConstraint.activate([
            haventStartedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            haventStartedView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            haventStartedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            haventStartedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func setupCalendar() {
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 4.0),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func setupWithoutStepsState() {
        view.addSubview(withouStepsView)
        withouStepsView.delegate = self
        
        NSLayoutConstraint.activate([
            withouStepsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            withouStepsView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
            withouStepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            withouStepsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func setupSteps() {
        view.addSubview(stepsView)
        stepsView.delegate = self
        
        NSLayoutConstraint.activate([
            stepsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stepsView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 2.0),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stepsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    fileprivate func setupNavigation() {
        navigationItem.title = "Goal"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
    }
}

extension DetailGoalViewController: GoalHaventStartedDelegate {
    func startGoal() {
        let alertController = UIAlertController(title: "Congratulations", message: "You just started this goal. Now you have to create your first step.", preferredStyle: .alert)
        
        let startGoalAction = UIAlertAction(title: "Let's go", style: .default) { (_) in
            //code over here to create your goal, this settings of core here
            self.dismiss(animated: true, completion: nil)
            self.goal?.isStarted = true
            self.haventStartedView.removeFromSuperview()
            self.setupCalendar()
            self.setupWithoutStepsState()
            self.headerView.startProgress()
        }
        
        alertController.addAction(startGoalAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension DetailGoalViewController: WithoutStepsDelegate {
    func createFirstStep() {
        //call create step scene
        //return from create step scene and change the state for stepsview
        print("create first step")
    }
}

extension DetailGoalViewController: StepsViewDelegate {
    func createStep() {
        print("create step")
    }
    func finishMonthProgress() {
        print("finish month progress")
    }
}
