//  DAO.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 13/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.


import UIKit
import CoreData

public protocol DAO {
    associatedtype Object
    func insert(object: Object)
    func delete(object: Object)
    func all() -> [Object]
}
