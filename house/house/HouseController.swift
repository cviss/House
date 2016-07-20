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
        
        //Create fileUrl for HouseController
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            self.fileUrl = try documents.appendingPathComponent("house")
        }
        catch {
            print("failed to make file URL for house or Document Jansen")
            self.fileUrl = nil
        }
        
        
    }
    
    //Restore House object from memory. Returns true if successful.
    func restoreHouse() -> Bool {
        guard let house = NSKeyedUnarchiver.unarchiveObject(withFile: self.fileUrl.path!) as? House else {
            print("No House Loaded")
            return false
        }
        self.house = house
        return true
    }
    
    //Saves House object to memory. Returns true and saves if house is not nil.
    func saveHouse() -> Bool {
        guard house != nil else {
            return false
        }
        NSKeyedArchiver.archiveRootObject(house!, toFile: self.fileUrl.path!)
        return true
    }
    
    
}
