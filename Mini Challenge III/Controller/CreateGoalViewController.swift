//
//  CreateGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController {
    
    let cellId: String = "cellId"
    var currentStep: Int = 1
    var stepContentCount : Int = 0
    var numberOfRowsInSection : Int = 2
    var activePreviewButton = false
    var goalJSON = Goal(name: "", description: "", how: "", when: "", progress: 0)
    
    fileprivate lazy var progressStepView: ProgressStepView  = {
        let progress = ProgressStepView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    fileprivate var count = 0
    
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    fileprivate lazy var nextButton: UIButton = {
        let button = UIButton(title: "Next")
        button.addTarget(self, action: #selector(changeContent), for: .touchUpInside)
        return button
    }()
    fileprivate lazy var prevButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(previewContent), for: .touchUpInside)
        button.setTitle("Preview", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Helvetica", size: 20)
        button.setTitleColor(#colorLiteral(red: 0.2823529412, green: 0.4745098039, blue: 0.8431372549, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    fileprivate lazy var stackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate var goalfields = [GoalField(name: "What is the name of your goal?", placeHolder: "Ex: Travel to France"), GoalField(name: "Specific your goal!", placeHolder: "Ex: Plan and execute five customer education webinars this quarter with 15-plus attendees per event and 80% or higher "), GoalField(name: "How you make this?", placeHolder: "Ex: Save money every day"), GoalField(name: "When?", placeHolder: "Ex: May in the next month")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(tap)
        setNavigationItems()
        buildViewHierarchy()
        setupTableView()
    }
    
    @objc fileprivate func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    fileprivate func setNavigationItems() {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AlNile-Bold", size: 40)!]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2823529412, green: 0.4745098039, blue: 0.8431372549, alpha: 1)
        navigationItem.title = "Create Your Goal"
        navigationController?.navigationBar.prefersLargeTitles = true
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToController))
        cancelButton.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButton
    }
    fileprivate func buildViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(nextButton)
        view.addSubview(prevButton)
        stackview.addArrangedSubview(nextButton)
        view.addSubview(stackview)
        view.addSubview(progressStepView)
        setupConstraints()
    }
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            progressStepView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            progressStepView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            progressStepView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 65),
            progressStepView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            tableView.topAnchor.constraint(equalTo: progressStepView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 18),
            
            stackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            stackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            stackview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08)
            
            ])
    }
    
    @objc fileprivate func backToController() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreateGoalViewController {
    
    @objc func changeContent(sender: UIButton) {
        progressStepView.verifyCurrentStep(currentStep: self.currentStep)
        if self.currentStep == 1 {
            let currentCell1 = tableView.visibleCells[0] as! CreateGoalsViewCell
            let currentCell2 = tableView.visibleCells[1] as! CreateGoalsViewCell
            self.goalJSON.name = currentCell1.contextTf.text!
            self.goalJSON.description = currentCell2.contextTf.text!
            currentCell1.contextTf.text =  self.goalJSON.how
        } else if currentStep == 2{
            let currentCell1 = tableView.visibleCells[0] as! CreateGoalsViewCell
            self.goalJSON.how = currentCell1.contextTf.text!
            currentCell1.contextTf.text = self.goalJSON.when
        } else if currentStep == 3{
            let currentCell1 = tableView.visibleCells[0] as! CreateGoalsViewCell
            self.goalJSON.when = currentCell1.contextTf.text!
            currentCell1.contextTf.text = self.goalJSON.when
        }
        
        let currentCell = self.tableView.visibleCells[0] as! CreateGoalsViewCell
        
        if currentCell.contentText.text == "When?" {
        let resumeVC = ResumeViewController()
            resumeVC.goal = self.goalJSON
            resumeVC.setPropertieToGoalInView(goal: goalJSON)
         self.navigationController?.pushViewController(resumeVC, animated: true)
        }
        
        
        if self.currentStep < 3 {
            self.currentStep += 1
        }
        self.numberOfRowsInSection = 1
        if self.stepContentCount < 3 {
            self.stepContentCount += 2
        }
        
        tableView.reloadData()
    }
    @objc func previewContent(sender: UIButton){
        if self.currentStep > 0 {
            self.currentStep -= 1
            progressStepView.verifyCurrentStep(currentStep: self.currentStep)
        }
        
        if self.stepContentCount == 2 {
            self.stepContentCount -= 2
        } else if self.stepContentCount == 3{
            self.stepContentCount -= 1
        }
        if self.stepContentCount < 2 {
            self.numberOfRowsInSection = 2
        }
        
        if self.currentStep == 1{
            progressStepView.verifyCurrentStep(currentStep: 1)
        }
        
        if self.currentStep == 2{
            let currentCell1 = tableView.visibleCells[0] as! CreateGoalsViewCell
            currentCell1.contextTf.text = self.goalJSON.how
        } else if self.currentStep == 3{
            let currentCell1 = tableView.visibleCells[0] as! CreateGoalsViewCell
            currentCell1.contextTf.text = self.goalJSON.when
        }
        tableView.reloadData()
    }
}

extension CreateGoalViewController: UITableViewDelegate, UITableViewDataSource {
    fileprivate func setupTableView() {
        view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
        tableView.register(CreateGoalsViewCell.self, forCellReuseIdentifier: cellId)
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CreateGoalsViewCell
        if self.stepContentCount == 4{
            self.stepContentCount -= 1
        }
        if self.stepContentCount == 2 {
            self.stackview.removeArrangedSubview(nextButton)
            self.stackview.addArrangedSubview(prevButton)
            self.stackview.addArrangedSubview(nextButton)
        } else if self.stepContentCount == 0 {
            self.prevButton.removeFromSuperview()
        }
        print("current step indo",self.currentStep)
        let _index = indexPath.row+self.stepContentCount
        //        if(_index >= 0 ){
        cell?.contentText.text = goalfields[_index].name
        cell?.contextTf.placeholder = goalfields[_index].placeHolder
        if self.currentStep == 1{
            print("TA NO UM \n")
            if _index == 0{
                cell?.contextTf.text = self.goalJSON.name
            } else if _index == 1{
                cell?.contextTf.text = self.goalJSON.description
            }
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRowsInSection
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
