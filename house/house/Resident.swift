//
//  Resident.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation

class Resident: NSCoder {
    var name: String
    var expenses: [String : ResidentExpense]
    
    init(name: String, expenses: [String : ResidentExpense]) {
        self.name = name
        self.expenses = expenses
    }
    
    required init?(coder: NSCoder) {
        name = (coder.decodeObject(forKey: "name") as? String) ?? ""
        expenses = (coder.decodeObject(forKey: "expenses") as? [String : ResidentExpense]) ?? [:]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(expenses, forKey: "expenses")
    }
}
