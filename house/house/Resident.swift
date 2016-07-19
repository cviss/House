//
//  Resident.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation

class Resident {
    var name: String
    var expenses: [String : ResidentExpense]
    
    init(name: String, expenses: [String : ResidentExpense]) {
        self.name = name
        self.expenses = expenses
    }
}
