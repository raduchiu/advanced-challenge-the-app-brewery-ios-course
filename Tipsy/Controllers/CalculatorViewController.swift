//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberButton: UILabel!
    
    var tip = 0.10
    var numberofPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonMinusPercentSign = sender.currentTitle!.dropLast()
        
        let buttonTitleAsNumber = Double(buttonMinusPercentSign)!
        
         tip = buttonTitleAsNumber/100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberButton.text = String(format: "%.f", sender.value)
        
        numberofPeople = Int(sender.value)
        
    }
    @IBAction func calculatedPressed(_ sender: UIButton) {
            
            let bill = billTextField.text!
        
        if bill != "" {
        
            billTotal = Double(bill)!
            
            finalResult = String(format: "%.2f", billTotal * (1 + tip) / Double(numberofPeople))
            
            print(tip)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults"{
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberofPeople
            
            
        }
    }
    
}

