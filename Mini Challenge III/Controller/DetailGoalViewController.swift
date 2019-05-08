//
//  DetailGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DetailGoalViewController: UIViewController {

    fileprivate let cellId: String = "DetailCellId"
    
    public var goal: Goal?
    
    lazy var headerView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = #colorLiteral(red: 0.8261345625, green: 0.8212244511, blue: 0.8299093843, alpha: 1)
            return view
    }()
    
    lazy var addNewStepButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(addNewStep), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "plus"), for: .normal)
       return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.register(DetailGoalViewCell.self, forCellReuseIdentifier: self.cellId)
        return tableView
    }()
    
    lazy var trackLayer: CAShapeLayer = {
        let trackLayer  = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 200, y: 200), radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
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
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 200, y: 200), radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        buidViewHierarchy()
        setupConstraints()
    }
    
    fileprivate func buidViewHierarchy() {
        view.addSubview(headerView)
        view.addSubview(tableView)
        headerView.layer.addSublayer(trackLayer)
        headerView.layer.addSublayer(trackLayerGray)
        headerView.addSubview(percentageLabel)
        headerView.addSubview(addNewStepButton)
    }
    
    fileprivate func setupConstraints() {
         percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         percentageLabel.center = CGPoint(x: 200, y: 200)
        NSLayoutConstraint.activate([ addNewStepButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            addNewStepButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -35),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/2) - 100),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
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
//    var imageEmptyState: UIImageView!
//    fileprivate func setEmptyState() {
//        imageEmptyState = UIImageView()
//        imageEmptyState.image = #imageLiteral(resourceName: "emptyState.png")
//        tableView.addSubview(imageEmptyState)
//        imageEmptyState.centerInSuperview()
//    }
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
        tableView.reloadData()
    }
    
    fileprivate func textField(texField: UITextField) {
        self.textField = texField
        textField.placeholder = "Add your step"
    }
    
}

extension DetailGoalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.goal?.steps.count == 0 {
//            setEmptyState()
//        } else {
//            imageEmptyState.removeFromSuperview()
//        }
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
