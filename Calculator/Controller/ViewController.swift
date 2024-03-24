//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var displayLabel: UILabel!
    private var didFinishTyping: Bool = true
    private var isDecimalPointAdded: Bool = false
    private var calcLgic = CalculatorLogic()
    
    private var displyValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Could not convert \(String(describing: displayLabel.text)) to double!")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
            calcLgic.setNumber(displyValue)

        }
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        let binaryOperations = ["+", "-", "÷", "×"]
        
        if let operation = sender.currentTitle {
            if displayLabel.text == "0" {
                return
            } else {
                if let val = calcLgic.calculate(symbol: operation) {
                    displyValue = val
                    if displyValue == 0 || binaryOperations.contains(operation) {
                        didFinishTyping = true
                        isDecimalPointAdded = false
                    } 
                }
               
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numVal = sender.currentTitle {
            if didFinishTyping {
                displayLabel.text = sender.currentTitle
                didFinishTyping = false
            } else {
                if numVal == "." {
                    if !isDecimalPointAdded {
                        //Add decimal point for the first time
                        displayLabel.text! += numVal
                        isDecimalPointAdded = true
                    }
                } else {
                    displayLabel.text! += numVal
                }
            }
            if let val = Double(displayLabel.text!) {
                calcLgic.setNumber(val)
            }
        }
    }
    
}

