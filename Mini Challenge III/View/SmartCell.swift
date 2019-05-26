//
//  SmartCell.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 24/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit


class SmartCell: UICollectionViewCell, Reusable {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "smart"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
