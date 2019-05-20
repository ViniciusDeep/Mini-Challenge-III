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

class Mini_Challenge_IIITests: XCTestCase {
    
    var goal: Goal?
   
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
    
    func testIfUserIsLogged() {
        UserDefaults.standard.setIsLoggedIn(value: true)
        let userDefaultResponse = UserDefaults.standard.isLoggedIn()
        XCTAssertTrue(userDefaultResponse)
    }
    
    func testPageModel() {
        var pages = [Page]()
        let page = Page(title: "Page One", message: "This almost one page that i have", imageName: "today")
        pages.append(page)
        XCTAssertNotNil(page)
        pages.removeAll()
        XCTAssertEqual(0, pages.count)
    }
    
    override func setUp() {}

    override func tearDown() {}

    func testExample() {}

    func testPerformanceExample() {
        self.measure {}
    }

}
