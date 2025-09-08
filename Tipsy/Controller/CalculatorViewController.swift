//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipCalculator = TipCalculator()
 

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    

    var tipButtons: [UIButton] {
        return [zeroPctButton, tenPctButton, twentyPctButton]
    }
    
    let tips:[String: Double] = ["0%": 0, "10%": 0.1, "20%": 0.2]
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        for button in tipButtons {
            button.isSelected = false
        }
        
        sender.isSelected = true
        tipCalculator.tipAmount = tips[sender.title(for: .normal)!] ?? 0
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        tipCalculator.splitNumber = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = Double(billTextField.text ?? "0") ?? 0
        tipCalculator.calculateTipForEachPerson(billAmount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billPerPerson = tipCalculator.getBillPerPerson()
            destinationVC.numberOfPeople = Int(tipCalculator.splitNumber)
            destinationVC.tipPercentage = tipCalculator.getTipPercent()
        }
    }
}

