//
//  CoreDataManager.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 21/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    var stepDAO = CoreDataDAO<StepCore>()
    var goalDAO = CoreDataDAO<GoalCore>()

    func setStep(goal: GoalCore, step: StepCore) {
        goal.addToSteps(step)
        stepDAO.insert(object: step)
    }
    
    func fetchSteps(from goal: GoalCore) -> [StepCore] {
        return goal.steps
    }
}
