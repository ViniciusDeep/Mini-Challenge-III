//
//  BaseListController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 23/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController{
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
