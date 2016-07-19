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
    let house = House(image: UIImage(named: "defaultHouse"), address: "", residents: nil, expenses: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            let fileURL = try documents.appendingPathComponent("house")
            
            if let house = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path!) as? House {
                self.house.image = house.image
                self.house.address = house.address
                self.house.residents = house.residents
                self.house.expenses = house.expenses
            }

        } catch {
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

