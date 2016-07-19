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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            let fileUrl = try documents.appendingPathComponent("address")
            textField.text = try String(contentsOf: fileUrl)
        } catch {
            print("failed to load")
        }
    }

    @IBAction func saveAddressPressed(_ sender: AnyObject) {
        let house = House(image: nil, address: textField.text, residents: nil, expenses: nil)
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            let fileUrl = try documents.appendingPathComponent("address")
            NSKeyedArchiver.archiveRootObject(house, toFile: fileUrl.path!)
        } catch {
            print("failed to save")
        }
    }

}

