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
    

    
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var residentField: UITextField!
    
    
    var house: House! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HouseController.sharedInstance.restoreHouse()
        addressField.text = HouseController.sharedInstance.house.address
    }

    @IBAction func saveAddressPressed(_ sender: AnyObject) {
        HouseController.sharedInstance.house.address = addressField.text!
        HouseController.sharedInstance.saveHouse()
    }
    
    var l = 0
    @IBAction func saveResidentPressed(_ sender: AnyObject) {
        HouseController.sharedInstance.house.residents.append(Resident(name: residentField.text!, expenses: [:]))
        HouseController.sharedInstance.saveHouse()
        l += 1
    }

    var i = 0
    @IBAction func loadResidentPressed(_ sender: AnyObject) {
        residentField.text = HouseController.sharedInstance.house.residents[i].name
        i += 1
    }

   
    
    
    
    
    
    

}

