//
//  NSManagedObject+Extension.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import CoreData

extension NSManagedObject {
    static var className: String {
        return String(describing: self)
    }
}
