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
    let fileUrl: URL!
    
    static var sharedInstance = HouseController()
    var house: House! = nil
    
    init() {
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            self.fileUrl = try documents.appendingPathComponent("house")
        }
        catch {
            print("failed to make file URL for house or Document Jansen")
            self.fileUrl = nil
        }
    }
    
    func restoreHouse() {
            guard let house = NSKeyedUnarchiver.unarchiveObject(withFile: self.fileUrl.path!) as? House else {
                print("No House Loaded")
                return
            }
            self.house = house
    }
    
    func saveHouse() {
            NSKeyedArchiver.archiveRootObject(house, toFile: self.fileUrl.path!)
    }
    
}
