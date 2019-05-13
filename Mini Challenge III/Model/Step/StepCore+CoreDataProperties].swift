//
//  StepCore+CoreDataProperties].swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreData

extension StepCore {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<StepCore> {
        return NSFetchRequest<StepCore>(entityName: "StepCore")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var about: String
    @NSManaged public var isStarted: Bool
}

extension StepCore {
    @objc(addEpisodesObject:)
    @NSManaged public func addGoal(_ value: GoalCore)
    
    @objc(removeEpisodesObject:)
    @NSManaged public func removeGoal(_ value: GoalCore)
    
    @objc(addEpisodes:)
    @NSManaged public func addToGoal(_ values: NSSet)
    
    @objc(removeEpisodes:)
    @NSManaged public func removeFromGoal(_ values: NSSet)
    
}
