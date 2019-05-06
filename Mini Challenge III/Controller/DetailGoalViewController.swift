//
//  DetailGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DetailGoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate let cellId: String = "DetailCellId"
    
    public var goal: Goal?

    lazy var headerView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return view
    }()
    
    lazy var addNewStepButton: UIButton = {
       let button = UIButton()
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
        setComponents()
    }
    
    fileprivate func setComponents() {
        headerView.layer.addSublayer(trackLayer)
        headerView.layer.addSublayer(trackLayerGray)
        headerView.addSubview(percentageLabel)
        headerView.addSubview(addNewStepButton)
        addNewStepButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
        addNewStepButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -35).isActive = true
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = CGPoint(x: 200, y: 200)
        view.addSubview(headerView)
        view.addSubview(tableView)
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/2) - 100).isActive = true
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? DetailGoalViewCell
        cell?.checkButton.addTarget(self, action: #selector(checkStep), for: .touchUpInside)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
}
