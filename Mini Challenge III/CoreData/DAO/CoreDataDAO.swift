//
//  CoreDataDAO.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit
import CoreData

public class CoreDataDAO<Element: NSManagedObject>: DAO {
    
    public var context: NSManagedObjectContext
    
    public init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persisentContainer.viewContext
    }
    public func insert(object: Element) {
        context.insert(object)
        save()
    }
    public func delete(object: Element) {
        context.delete(object)
        save()
    }
    public func all() -> [Element] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Object.className)
        let result =  try! context.fetch(request) as! [Object]
        return result
    }
    private func save() {
       try! context.save()
    }
    public func new() -> Element {
        return NSEntityDescription.insertNewObject(forEntityName: Element.className, into: context) as! Element
    }
}
