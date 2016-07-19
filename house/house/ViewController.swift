//
//  ViewController.swift
//  house
//
//  Created by Cole Weis on 7/17/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let manager = FileManager.default()
    
    @IBOutlet weak var textField: UITextField!
    var house: House! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            let fileURL = try documents.appendingPathComponent("house")
            guard let house = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path!) as? House else {
                print("No House Loaded")
                return
            }
            self.house = house
        }
        catch {
            print("failed to load")
        }
        
        textField.text = house.address
    }

    @IBAction func saveAddressPressed(_ sender: AnyObject) {
        let house = House(image: nil, address: textField.text, residents: nil, expenses: nil)
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            let fileUrl = try documents.appendingPathComponent("house")
            NSKeyedArchiver.archiveRootObject(house, toFile: fileUrl.path!)
        } catch {
            print("failed to save")
        }
        
    }

}

