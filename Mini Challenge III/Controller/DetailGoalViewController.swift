//
//  DetailGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

enum GoalDetailState {
	case notStarted
	case haventStep
	case running
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
	
	public var goal: Goal?
	fileprivate let cellId: String = "DetailCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        view.backgroundColor = .white
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		setupNavigation()
	}
	
	convenience init(with goal: Goal) {
		self.init()
		
		setupHeaderView(goal)
		setupCalendar()
//		setupWithoutStepsState()
		setupSteps()
		
		//verifing state
		/*
		if (goal.isStarted) {
			if (goal.steps.count != 0) {
				
			}
			else {
				
			}
		}
		else {
			setupNotStartedState()
		}
*/
	}
	
	func setupHeaderView(_ goal: Goal) {
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
			calendarView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2.0),
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
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
}

extension DetailGoalViewController: GoalHaventStartedDelegate {
	func startGoal() {
		print("start goal")
	}
}

extension DetailGoalViewController: WithoutStepsDelegate {
	func createStep() {
		print("create step")
	}
}

extension DetailGoalViewController: StepsViewDelegate {
	func finishMonthProgress() {
		print("finish month progress")
	}
}
