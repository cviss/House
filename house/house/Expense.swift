//
//  Expense.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation

class Expense {
    var name: String
    var monthly: Bool
    
    init(name: String, monthly: Bool) {
        self.name = name
        self.monthly = monthly
    }
}
