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

    fileprivate let cellId: String = "DetailCellId"
    
    public var goal: Goal?
    
    lazy var headerView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    let centerX:Double = 187; let centerY:Double = 130;
    let radius = (UIScreen.main.bounds.width/2) - 130
    lazy var trackLayer: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        guard let progress = self.goal?.progress else {return trackLayer}
        trackLayer.strokeEnd = progress
        trackLayer.strokeColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).cgColor
        trackLayer.lineWidth = 3
        trackLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        return trackLayer
    }()
    
    lazy var trackLayerGray: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeEnd = 1
        trackLayer.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        trackLayer.lineWidth = 3
        trackLayer.opacity = 0.3
        trackLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        return trackLayer
    }()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        guard let progress = self.goal?.progress else {return label}
        if progress == 0.0 {
            label.text = "Start"
        } else {
             label.text = "\(progress * 100)%"
        }
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    lazy var nameOfGoal: UILabel = {
        let label = UILabel()
        label.text = self.goal?.name
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionGoal: UILabel = {
        let label = UILabel()
        label.text = self.goal?.description
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
		
		setupNotStartedState()
		//verifing state
		if (goal.isStarted) {
			if (goal.steps.count != 0) {
				
			}
			else {
				
			}
		}
		else {
			
		}
//			buidViewHierarchy()
//			setupConstraints()
	}
	
	func setupHeaderView() {
		view.addSubview(headerView)
		headerView.layer.addSublayer(trackLayer)
		headerView.layer.addSublayer(trackLayerGray)
		headerView.addSubview(percentageLabel)
		headerView.addSubview(nameOfGoal)
		headerView.addSubview(descriptionGoal)
		
		percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		percentageLabel.center = CGPoint(x: centerX, y: centerY)
		NSLayoutConstraint.activate([
			headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			headerView.topAnchor.constraint(equalTo: view.topAnchor),
			headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(UIScreen.main.bounds.width/2) - 240),
			nameOfGoal.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 200),
			nameOfGoal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			descriptionGoal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			descriptionGoal.topAnchor.constraint(equalTo: nameOfGoal.bottomAnchor, constant: 10)
		])
	}
	
	func setupNotStartedState() {
		view.addSubview(haventStartedView)
		
		NSLayoutConstraint.activate([
			haventStartedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			haventStartedView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
			haventStartedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			haventStartedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
    fileprivate func setupNavigation() {
        navigationItem.title = "Goal"
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }

//    fileprivate func buidViewHierarchy() {
//        view.addSubview(addNewStepButton)
//        view.addSubview(nameOfGoal)
//        view.addSubview(descriptionGoal)
//    }
	
    fileprivate func setupConstraints() {
//         percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//         percentageLabel.center = CGPoint(x: centerX, y: centerY)
//        NSLayoutConstraint.activate([ addNewStepButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//             addNewStepButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
//            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            headerView.topAnchor.constraint(equalTo: view.topAnchor),
//            headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(UIScreen.main.bounds.width/2) - 240),
//            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            nameOfGoal.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 200),
//            nameOfGoal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            descriptionGoal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            descriptionGoal.topAnchor.constraint(equalTo: nameOfGoal.bottomAnchor, constant: 10)
//        ])
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
