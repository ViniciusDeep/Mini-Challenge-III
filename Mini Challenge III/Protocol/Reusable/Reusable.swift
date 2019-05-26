//
//  Reusable.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 26/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
