//
//  SmartAppFullScreenController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 24/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit


class SmartFullScreenController: UITableViewController {
  
    var dismissHandler: (() ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = SmartCell()
//        return header
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 450
//    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    @objc fileprivate func handleDismiss(button: UIButton) {
        button.isHidden = true
        dismissHandler?()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let smartFullScreenHeaderCell = SmartFullScreenHeaderCell()
            smartFullScreenHeaderCell.closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            return smartFullScreenHeaderCell
        }
        
        
        
        let cell = SmartFullScreenDescriptionCell()
        return cell

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    
}
