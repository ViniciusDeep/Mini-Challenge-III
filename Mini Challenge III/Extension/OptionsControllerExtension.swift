//
//  OptionsControllerExtension.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 11/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

extension OptionsController {
    public func setupTableView() {
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: cellHeaderId)
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 50
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: cellHeaderId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "About SMART"
        case 1:
            cell.textLabel?.text = "Started tutorial"
        default:
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(SmartController(), animated: true)
        case 1:
            present(LoginController(), animated: true, completion: nil)
        default:
            break
        }
    }
    
}
