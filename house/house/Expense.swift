//
//  Expense.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation

class Expense: NSCoding {
    
    //Initialize.
    var name: String
    var monthly: Bool
    
    init(name: String, monthly: Bool) {
        self.name = name
        self.monthly = monthly
    }
    
    //Set up coding.
    required init?(coder: NSCoder) {
        name = (coder.decodeObject(forKey: "name") as? String) ?? ""
        monthly = (coder.decodeObject(forKey: "monthly") as? Bool) ?? false
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(monthly, forKey: "monthly")
    }
}
