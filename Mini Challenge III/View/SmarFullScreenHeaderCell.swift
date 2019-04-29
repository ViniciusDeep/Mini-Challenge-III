//
//  SmarFullScreenHeaderCell.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 24/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class SmartFullScreenHeaderCell: UITableViewCell {
    
    let smartCell = SmartCell()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(smartCell)
        smartCell.fillSuperview()
        
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 12), size: .init(width: 80, height: 38))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
