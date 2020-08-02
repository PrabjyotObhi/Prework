//
//  ViewController.swift
//  TipCalculator
//
//  Created by Prabyot Obhi on 7/31/20.
//  Copyright © 2020 Prabyot Obhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets/Labels and Fields to be able to manipulate the data
    //Get value from billfield and update the value shown in the tip and total labels
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func on(_ sender: Any) {
        print("HelloWorld")
        //This line is to dismiss the keyboard
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0

        //Calculate Tip
        let tipPercentages = [0.15, 0.18, 0.2]

        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let total = bill + tip
        
        
        //Update tip and total Labels
        tipLabel.text = String(format: "$%0.2f",tip)
        totalLabel.text  = String(format: "$%0.2f",total)
    
        
    }
    
    @IBAction func calculatePricePerPerson(_ sender: Any) {
       
        let amtOfPeople = Double(peopleField.text!) ?? 0
        
        let bill = Double(billField.text!) ?? 0
        //Calculate Tip
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        let pricePerPerson = total/amtOfPeople
        
        priceLabel.text = String(format: "$%0.2f",pricePerPerson)
    
    }
    
    
    @IBAction func onTapSplit(_ sender: Any) {
        print("GoodBye World")
        view.endEditing(true)
    }
    
  
}

