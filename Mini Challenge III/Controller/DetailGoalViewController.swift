//
//  DetailGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import UIKit

enum DetailGoalState {
	case haventStarted, withoutSteps, withSteps
}

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
    
    public var goal: GoalCore?
	var currentState: DetailGoalState?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
		title = "Goal"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    convenience init(with goal: GoalCore) {
        self.init()
		
		self.goal = goal
		buildViewHierarchy()
    }
	
	func buildViewHierarchy() {
		if let state = currentState {
			switch state {
			case .haventStarted:
				haventStartedView.removeFromSuperview()
				
				setupCalendar()
				setupWithoutStepsState()
				
				currentState = .withoutSteps
			case .withoutSteps:
				withouStepsView.removeFromSuperview()
				
				headerView.startProgress()
				setupSteps()
				
				currentState = .withSteps
			case .withSteps:
				break
			}
		} else {
			if let goal = self.goal {
				setupHeaderView(goal)
				
				if goal.isStarted {
					setupCalendar()
					
					if goal.steps.count != 0 {
						setupSteps()
						currentState = .withSteps
					} else {
						setupWithoutStepsState()
						currentState = .withoutSteps
					}
				} else {
					setupNotStartedState()
					currentState = .haventStarted
				}
			}
		}
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
		haventStartedView.setContent(goal?.name, goal?.about)
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
		withouStepsView.setContent(goal?.name, goal?.about)
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
            self.dismiss(animated: true, completion: nil)
            self.goal?.isStarted = true
			
			self.buildViewHierarchy()
        }
        
        alertController.addAction(startGoalAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension DetailGoalViewController: WithoutStepsDelegate {
    func createFirstStep() {
        let createStepVC = CreateStepViewController()
		createStepVC.delegate = self
		
		present(createStepVC, animated: true, completion: nil)
    }
}

extension DetailGoalViewController: StepsViewDelegate {
    func createStep() {
		let createStepVC = CreateStepViewController()
		createStepVC.delegate = self
		
		present(createStepVC, animated: true, completion: nil)
    }
    func finishMonthProgress() {
        print("finish month progress")
    }
}

extension DetailGoalViewController: CreateStepDelegate {
	func stepCreated(_ name: String?, _ description: String?) {
//		let stepDao = CoreDataDAO<StepCore>()
//		let step = stepDao.new()
//		step.name = name
//		step.about = description
//		step.isCompleted = false
//
//		self.goal?.addToSteps(step)
		
		if let state = currentState {
			if state == .withoutSteps {
				buildViewHierarchy()
			} else {
				stepsView.reloadData()
			}
		}
	}
}
