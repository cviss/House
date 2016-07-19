//
//  House.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation
import UIKit

class House {
    var image: UIImage
    var address: String
//    var accountInfo: Info
    var residents: [Resident]
    var expenses: [Expense]
    
    init(image: UIImage, address: String, residents: [Resident], expenses: [Expense]) {
        self.image = image
        self.address = address
        self.residents = residents
        self.expenses = expenses
    }
    
    
}
