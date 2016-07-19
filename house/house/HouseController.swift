//
//  HouseController.swift
//  house
//
//  Created by Cole Weis on 7/19/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import Foundation
import UIKit

class HouseController {
    let manager = FileManager.default()
    
    
    //All Save Function Posiibilities\\
    
    func loadHouse() -> House {
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            let fileUrl = try documents.appendingPathComponent("house")
            let house = try String(contentsOf: fileUrl) as! House
            return house
        } catch {
            print("failed to load")
        }
    }
}
