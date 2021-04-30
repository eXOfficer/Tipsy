//
//  ViewController.swift
//  Tipsy
//
//  Created by Adnan Sarker on 30/04/2021.
//  Copyright © 2021 Justdreams. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    var tip = 0.0
    var numOfPeople = 0
    var total: Double = 0.0
    var finalResult = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.currentTitle! == "10%" {
            sender.isSelected = true
            tip = 0.1
        }
        else if sender.currentTitle! == "0%" {
            sender.isSelected = true
            tip = 0.0
        }
        else if sender.currentTitle! == "20%" {
            sender.isSelected = true
            tip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numOfPeople = Int (sender.value)
        splitNumberLabel.text = String( format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //print (numOfPeople)
        let bill = billTextField.text!
        
        if bill != "" {
            total = Double (bill) ?? 0.0
            total = (total + (total * tip)) / Double(numOfPeople)
            finalResult = String(format: "%.2f", total)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.finalResult = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.numOfPeople = numOfPeople
        }
    }
    
}

