//
//  ViewController.swift
//  Tipper
//
//  Created by Siddhant Jayant Angore on 14/10/19.
//  Copyright © 2019 Siddhant Jayant Angore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var twentyPerButtonLabel: UIButton!
    @IBOutlet weak var tenPerButtonLabel: UIButton!
    @IBOutlet weak var zeroPerButtonLabel: UIButton!
    @IBOutlet weak var amountTextFieldLabel: UITextField!
    @IBOutlet weak var calculateButtonLabel: UIButton!
    
    //MARK : variables
    var tip = 0.10
    var numberOfPeople = 1
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButtonLabel.layer.cornerRadius = 15
        
    }
    
    
    @IBAction func tipSelected(_ sender: UIButton) {
        
        amountTextFieldLabel.endEditing(true)
        
        zeroPerButtonLabel.isSelected = false
        tenPerButtonLabel.isSelected = false
        twentyPerButtonLabel.isSelected = false
        
        sender.isSelected = true
        
        let tipTitleSelected = Double(String(sender.currentTitle!.dropLast()))
        
        tip = (tipTitleSelected ?? 10) / 100
        
        }
        
    //stepper button
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperLabel.text = String(format : "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    //the calculate button pressed
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let bill = amountTextFieldLabel.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}

