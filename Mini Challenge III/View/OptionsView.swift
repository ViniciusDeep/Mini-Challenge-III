//
//  OptionsView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 10/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class OptionsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Header: UITableViewHeaderFooterView {
    
    lazy var headerName: UILabel = {
        let label = UILabel()
        label.text = "Helper"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        self.backgroundColor =  .tableViewColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(headerName)
        NSLayoutConstraint.activate([
                headerName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
                headerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            ])
    }
}
