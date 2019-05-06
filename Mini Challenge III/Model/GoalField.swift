//
//  GoalField.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 05/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation


struct GoalField {
    var name: String?
    var placeHolder: String?
    var text: String?
    
    init(name: String?, placeHolder: String) {
        self.name = name
        self.placeHolder = placeHolder
    }
}
