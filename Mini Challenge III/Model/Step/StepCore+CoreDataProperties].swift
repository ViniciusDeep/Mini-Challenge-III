//
//  StepCore+CoreDataProperties.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 21/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
//
import Foundation
import CoreData


extension StepCore {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<StepCore> {
        return NSFetchRequest<StepCore>(entityName: "StepCore")
    }
    
    @NSManaged public var about: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var name: String?
    @NSManaged public var goal: GoalCore?
}
