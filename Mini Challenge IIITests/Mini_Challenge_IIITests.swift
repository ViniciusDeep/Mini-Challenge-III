//
//  Mini_Challenge_IIITests.swift
//  Mini Challenge IIITests
//
//  Created by Vinicius Mangueira Correia on 22/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import XCTest
@testable import Mini_Challenge_III

class Mini_Challenge_IIITests: XCTestCase {
   
    var goal: Goal?
    fileprivate func initStubs() {
        goal = Goal(name: "Travel to Japan", description: "I need to make the trip to japan to bussiness", how: "Save every money that i take", when: "2 month", progress: 0)
    }
    
    func testIfUserIsLogged() {
        UserDefaults.standard.setIsLoggedIn(value: true)
        let userDefaultResponse = UserDefaults.standard.isLoggedIn()
        XCTAssertTrue(userDefaultResponse)
    }
    
    func testCalculatedProgress() {
        var steps = [Step]()
        steps.append(Step(name: "1", description: "First", isCompleted: true))
        steps.append(Step(name: "2", description: "Second", isCompleted: true))
        steps.append(Step(name: "3", description: "Third", isCompleted: true))
        steps.append(Step(name: "4", description: "Four", isCompleted: true))
        let progress = GoalHelper.getCurrenceProgress(steps: steps)
        XCTAssertEqual(progress, 100.0)
    }
    
    func testCoreDataGoalResponse() {
        let goalDAO = CoreDataDAO<GoalCore>()
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
        let goal = goalDao.new()
        goal.name = "Buy Iphone XR"
        goalDao.insert(object: goal)
        let goals = goalDao.all()
        XCTAssertEqual(goal.name, goals.last?.name)
        goalDao.delete(object: goal)
        XCTAssertNil(goals.last?.name)
    }

    
    func testGoalFieldsWithMockDates() {
        var goalfields = [GoalField(name: "Just more one field", placeHolder: "Set your data to just placeholder"), GoalField(name: "Set your dates mocked", placeHolder: "Dates mocked here"), GoalField(name: "Trying test myself", placeHolder: "MOCKED TEST")]
        goalfields.forEach { (goalfield) in
            XCTAssertNotNil(goalfield)
        }
        goalfields.removeAll()
        goalfields.forEach{ (goalfield) in
            XCTAssertNil(goalfield)
        }
    }

    func testSetPropertiesInResumeView() {
        let resumeVC = ResumeViewController()
        guard let goal = self.goal else {return}
        resumeVC.setPropertieToGoalInView(goal: goal)
        XCTAssertNotNil(goal)
        XCTAssertEqual(resumeVC.resumeView.goalHow.text, goal.how)
        XCTAssertEqual(resumeVC.resumeView.goalWhen.text, goal.when)
        XCTAssertEqual(resumeVC.resumeView.goalDescription.text, goal.description)
        XCTAssertNotNil(resumeVC.resumeView.createButton)
    }
    
    func testProgressStepsInCreateGoal() {
        let createGoalVC = CreateGoalViewController()
        createGoalVC.goal = self.goal
        createGoalVC.progressStepView.verifyCurrentStep(currentStep: 1)
        XCTAssertNotNil(createGoalVC)
        guard let imageCheked = createGoalVC.progressStepView.firstStep.image else {return}
        XCTAssertEqual(imageCheked, UIImage(named: "firststepchecked"))
    }
    override func setUp() {}

    override func tearDown() {}

    func testExample() {}

    func testPerformanceExample() {
        self.measure {}
    }

}
