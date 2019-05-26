//
//  ViewsNeed.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 16/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

protocol ConfigurableView: class {
    func buildViewHierarchy()
    func setupConstraints()
}
