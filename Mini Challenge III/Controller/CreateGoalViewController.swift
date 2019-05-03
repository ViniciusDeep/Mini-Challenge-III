//
//  CreateGoalViewController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController {
   
    var createView = CreateGoalsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(createView)
        setNavigationItems()
    }
    
    fileprivate func setNavigationItems() {
        navigationItem.title = "Create Your Goal"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToController))
    }
    
    @objc fileprivate func backToController() {
        dismiss(animated: true, completion: nil)
    }
}
