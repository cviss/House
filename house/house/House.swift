//
//  House.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation
import UIKit

class House: NSObject, NSCoding {
    var image: UIImage
    var address: String
//    var accountInfo: Info
    var residents: [Resident]
    var expenses: [Expense]
    
    init(image: UIImage, address: String, residents: [Resident], expenses: [Expense]) {
        self.image = UIImage()
        self.address = address
        self.residents = residents
        self.expenses = expenses
    }
    
    required init?(coder: NSCoder) {
        if let data = coder.decodeObject(forKey: "image") as? Data {
            image = UIImage(data: data) ?? UIImage(named: "defaultHouse")!
        } else {
            image = UIImage(named: "defaultHouse")!
        }
        address = (coder.decodeObject(forKey: "address") as? String) ?? ""
        residents = (coder.decodeObject(forKey: "residents") as? [Resident]) ?? []
        expenses = (coder.decodeObject(forKey: "expenses") as? [Expense]) ?? []
    }
    
    func encode(with coder: NSCoder) {
        let data = UIImagePNGRepresentation(image)
        coder.encode(data, forKey: "image")
        coder.encode(address, forKey: "address")
        coder.encode(residents, forKey: "residents")
        coder.encode(expenses, forKey: "expenses")
    }
    
    
}
