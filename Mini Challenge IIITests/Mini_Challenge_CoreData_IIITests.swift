//
//  Mini_Challenge_IIITests.swift
//  Mini Challenge IIITests
//
//  Created by Vinicius Mangueira Correia on 22/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import XCTest
import CoreData
@testable import Mini_Challenge_III

class Mini_Challenge_CoreData_IIITests: XCTestCase {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "data-base-test")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let err = error {
                fatalError("Error in connect")
            }
        })
        return container
    }()

    var context: NSManagedObjectContext!
    
    var goal: Goal?
    var goalCore: GoalCore?
    fileprivate func initStubs() {
        let coreDataDAO = CoreDataDAO<GoalCore>()
        coreDataDAO.context = self.context
        goalCore = coreDataDAO.new()
        XCTAssertNotNil(goalCore)
        goal = Goal(name: "Travel to Japan", description: "I need to make the trip to japan to bussiness", how: "Save every money that i take", when: "2 month", progress: 0)
        XCTAssertNotNil(goal)
    }
    
    func testCoreDataGoalResponse() {
        let goalDAO = CoreDataDAO<GoalCore>()
        goalDAO.context = self.context
        let goal = goalDAO.new()
        goal.name = "Travel to japan"
        goal.about = "This is goal consist in make the travel to japan"
        goal.how = "I have to save money to make like this, so i will save much money per week"
        goal.progress = 0.7
        goal.when = "1 year"
        goalDAO.insert(object: goal)
        let goals = goalDAO.all()
        XCTAssertNotNil(goals)
        XCTAssertEqual(goal.name, goals[0].name)
    }
    
    func testCoreDataStepResponse() {
        let stepDao = CoreDataDAO<StepCore>()
        stepDao.context = self.context
        let step = stepDao.new()
        step.name = "Save 30 money per week"
        step.about = "I need to sabe money almost 30$ per week for in 1 year"
        stepDao.insert(object: step)
        let steps = stepDao.all()
        XCTAssertNotNil(steps)
        XCTAssertEqual(step.about, steps[0].about)
    }
    
    func testCoreDataDelete() {
        let goalDao = CoreDataDAO<GoalCore>()
        goalDao.context = self.context
        let goal = goalDao.new()
        goal.name = "Buy Iphone XR"
        goalDao.insert(object: goal)
        let goals = goalDao.all()
        XCTAssertEqual(goal.name, goals.last?.name)
        goalDao.delete(object: goal)
        XCTAssertNil(goals.last?.name)
    }
    override func setUp() {
        self.context = persistentContainer.viewContext
    }
    
    override func tearDown() {}
    
    func testExample() {}
    
    func testPerformanceExample() {
        self.measure {}
    }
    
}
