//
//  ViewController.swift
//  house
//
//  Created by Cole Weis on 7/17/16.
//  Copyright © 2016 Carve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var residentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HouseController.sharedInstance.restoreHouse()
        addressField.text = HouseController.sharedInstance.house?.address
    }

    @IBAction func saveAddressPressed(_ sender: AnyObject) {
        HouseController.sharedInstance.house?.address = addressField.text!
        HouseController.sharedInstance.saveHouse()
    }
    
    var l = 0
    @IBAction func saveResidentPressed(_ sender: AnyObject) {
        HouseController.sharedInstance.house.residents.append(Resident(name: residentField.text!, expenses: [:]))
        do {
            let documents = manager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
            let fileUrl = try documents.appendingPathComponent("residents")
            NSKeyedArchiver.archiveRootObject(HouseController.sharedInstance.house.residents[0], toFile: fileUrl.path!)
        }
        catch {
            print("fail")
        }
        
//        HouseController.sharedInstance.saveHouse()
        l += 1
    }

    var i = 0
    @IBAction func loadResidentPressed(_ sender: AnyObject) {
        residentField.text = HouseController.sharedInstance.house.residents[i].name
        i += 1
    }

   
    
    
    
    
    
    

}

