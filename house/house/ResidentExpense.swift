//
//  ResidentExpense.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation

enum Month: String {
    case January = "January"
    case February = "February"
    case March = "March"
    case April = "April"
    case May = "May"
    case June = "June"
    case July = "July"
    case August = "August"
    case September = "September"
    case October = "October"
    case November = "November"
    case December = "December"
}

class ResidentExpense: NSCoder {
    var month: Month
    var price: Int
    var paid: Bool
    
    init(month: Month, price: Int, paid: Bool) {
        self.month = month
        self.price = price
        self.paid = paid
    }
    
    required init?(coder: NSCoder) {
        month = (coder.decodeObject(forKey: "month") as? Month) ?? .January
        price = (coder.decodeObject(forKey: "price") as? Int) ?? 0
        paid = (coder.decodeObject(forKey: "paid") as? Bool) ?? false
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(month.rawValue, forKey: "month")
        coder.encode(price, forKey: "price")
        coder.encode(paid, forKey: "paid")
    }
}
