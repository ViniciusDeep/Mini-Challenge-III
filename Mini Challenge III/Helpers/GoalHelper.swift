//
//  GoalHelper.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 06/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit


class GoalHelper {
    func getCurrenceProgress(steps: [Step]) -> CGFloat {
        let totalSteps = CGFloat(steps.count)
        var currenceProgress: CGFloat = 0.0
        steps.forEach { (step) in
            if step.isCompleted == true {
                currenceProgress += 1.0
            }
        }
        return (currenceProgress * totalSteps) / 100
    }
}
