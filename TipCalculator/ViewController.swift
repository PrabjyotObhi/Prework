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
    
    @IBOutlet weak var externalAppControl: UISegmentedControl!
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var sliderField: UISlider!
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
        let tipPercentages = [15.00, 18.00, 20.00, 0.00]
        
        var potentialTip = tipPercentages[tipControl.selectedSegmentIndex]
        
        if  potentialTip == 0 {
            potentialTip = Double(customTipField.text!) ?? 0
        }
    
        let tip = bill * (potentialTip/100)
        
        
        let total = bill + tip
        
        
        //Update tip and total Labels
        tipLabel.text = String(format: "$%0.2f",tip)
        totalLabel.text  = String(format: "$%0.2f",total)
    
        
    }
    
    @IBAction func calculatePricePerPerson(_ sender: Any) {
       //Figured out ??1 would be what we want to use 
        let amtOfPeople = Double(peopleField.text!) ?? 1
        
        let bill = Double(billField.text!) ?? 0
        //Calculate Tip
        let tipPercentages = [15.00, 18.00, 20.00, 0.00];
        
        var potentialTip = tipPercentages[tipControl.selectedSegmentIndex]
        
        if  potentialTip == 0 {
            potentialTip = Double(customTipField.text!) ?? 0;
        }
        sliderField.value = Float(potentialTip);

        sliderLabel.text = String(Double(potentialTip));
        
        let tip = bill * (potentialTip/100);
        let total = bill + tip;
        
        let pricePerPerson = total/amtOfPeople
        
        priceLabel.text = String(format: "$%0.2f",pricePerPerson)
    
    }
    
    
    @IBAction func onTapSplit(_ sender: Any) {
        print("GoodBye World")
        view.endEditing(true)
    }
    
  
    @IBAction func useSlider(_ sender: Any) {
        print("HelloWorld")
        sliderLabel.text = String((sliderField.value))
        
        let tipPercent = Double (sliderLabel.text!) ?? 0
        
        let bill = Double(billField.text!) ?? 0
        
        print("Tip Percent =", tipPercent)
        print("Bill = ", bill)
        print("Bill + tip = ",  bill+bill*((tipPercent)/100))
    
    }
    
    
    @IBAction func switchApp(_ sender: Any) {
        
        let externalApp = ["Venmo", "Zelle", "CashApp", "Paypal"]
        let app = externalApp[externalAppControl.selectedSegmentIndex]
        print("APP =", app)
        
    }
}

