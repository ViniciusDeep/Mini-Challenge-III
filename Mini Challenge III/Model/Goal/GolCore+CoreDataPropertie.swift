//
//  GolCore+CoreDataPropertie.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit
import CoreData

extension GoalCore {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalCore> {
        return NSFetchRequest<GoalCore>(entityName: "GoalCore")
    }
    @NSManaged public var name: String?
    @NSManaged public var about: Double
    @NSManaged public var when: String?
    @NSManaged public var how: String?
    @NSManaged public var progress: Float
}
extension GoalCore {
    @objc(addEpisodesObject:)
    @NSManaged public func addGoal(_ value: GoalCore)
    
    @objc(removeEpisodesObject:)
    @NSManaged public func removeGoal(_ value: GoalCore)
    
    @objc(addEpisodes:)
    @NSManaged public func addToGoal(_ values: NSSet)
    
    @objc(removeEpisodes:)
    @NSManaged public func removeFromGoal(_ values: NSSet)
}
