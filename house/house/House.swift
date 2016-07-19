//
//  House.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation
import UIKit

class House: NSCoding {
    var image: UIImage?
    var address: String?
//    var accountInfo: Info
    var residents: [Resident]?
    var expenses: [Expense]?
    
    init(image: UIImage?, address: String?, residents: [Resident]?, expenses: [Expense]?) {
        self.image = image
        self.address = address
        self.residents = residents
        self.expenses = expenses
    }
    
    required init?(coder: NSCoder) {
        image = (coder.decodeObject(forKey: "image") as? UIImage) ?? UIImage(named: "defaultHouse")!
        address = (coder.decodeObject(forKey: "address") as? String) ?? ""
        residents = (coder.decodeObject(forKey: "residents") as? [Resident]) ?? []
        expenses = (coder.decodeObject(forKey: "expenses") as? [Expense]) ?? []
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: "image")
        aCoder.encode(address, forKey: "address")
        aCoder.encode(residents, forKey: "residents")
        aCoder.encode(expenses, forKey: "expenses")
    }
    
    
}
