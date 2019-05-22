
//
//  GoalCore+CoreDataProperties.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 21/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
//
import Foundation
import CoreData


extension GoalCore {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalCore> {
        return NSFetchRequest<GoalCore>(entityName: "GoalCore")
    }
    
    @NSManaged public var about: String?
    @NSManaged public var how: String?
    @NSManaged public var isStarted: Bool
    @NSManaged public var name: String?
    @NSManaged public var progress: Float
    @NSManaged public var when: String?
    @NSManaged public var steps: [StepCore]
    
}

// accessors for steps
extension GoalCore {
    
    @objc(addStepsObject:)
    @NSManaged public func addToSteps(_ value: StepCore)
    
    @objc(removeStepsObject:)
    @NSManaged public func removeFromSteps(_ value: StepCore)
    
    @objc(addSteps:)
    @NSManaged public func addToSteps(_ values: NSSet)
    
    @objc(removeSteps:)
    @NSManaged public func removeFromSteps(_ values: NSSet)
    
}
