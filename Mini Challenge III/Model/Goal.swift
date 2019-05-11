//
//  Goal.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 05/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

struct Goal{
    var name: String?
    var description: String?
    var how: String?
    var when: String?
    var progress: CGFloat = 0
    lazy var steps = [Step]()
    var isStarted: Bool = false

    init(name: String, description: String, how: String, when: String, progress: CGFloat) {
        self.name = name
        self.description = description
        self.how = how
        self.when = when
        self.progress = progress
    }
}
