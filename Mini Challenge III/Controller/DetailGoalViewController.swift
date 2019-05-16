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
	lazy var headerView: CircularProgressView = {
		let view = CircularProgressView()
		return view
    }()
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
		
		setupHeaderView()
		setupCalendar()
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
	
	func setupHeaderView() {
		view.addSubview(headerView)
		
		NSLayoutConstraint.activate([
			headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	func setupNotStartedState() {
		view.addSubview(haventStartedView)
		
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
		
		NSLayoutConstraint.activate([
			withouStepsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			withouStepsView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
			withouStepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			withouStepsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	func setupSteps() {
		view.addSubview(stepsView)
		
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
    
    @objc fileprivate func checkStep(button: UIButton) {
        switch button.isSelected {
        case true:
            button.setImage(UIImage(named: "uncheck"), for: .normal)
            button.isSelected = false
        case false:
            button.setImage(UIImage(named: "check"), for: .normal)
            button.isSelected = true
        }
    }
    fileprivate var textField: UITextField!
    
    @objc fileprivate func addNewStep() {
        let alert = UIAlertController(title: "Add you new step", message: "Here you can add your new step", preferredStyle: .alert)
        alert.addTextField(configurationHandler: textField)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            self.configureNewStep()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func configureNewStep() {
        self.goal?.steps.append(Step(name: textField.text, description: nil, isCompleted: false))
//        tableView.reloadData()
    }
    
    fileprivate func textField(texField: UITextField) {
        self.textField = texField
        textField.placeholder = "Add your step"
    }
}
extension DetailGoalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.goal?.steps.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? DetailGoalViewCell
        guard let step = self.goal?.steps[indexPath.row] else {return UITableViewCell()}
        cell?.nameGoal.text = step.name
        cell?.checkButton.addTarget(self, action: #selector(checkStep), for: .touchUpInside)
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
