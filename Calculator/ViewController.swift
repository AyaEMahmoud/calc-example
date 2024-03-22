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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
    
        guard let number = Double(displayLabel.text!) else {
            fatalError("Could not convert \(String(describing: displayLabel.text)) to double!")
        }
        if let operation = sender.currentTitle {
            if displayLabel.text == "0" {
                return
            } else {
                if operation == "+/-" {
                    displayLabel.text = String(number * -1)
                } else if operation == "%" {
                    displayLabel.text = String(number * 0.01)
                } else if operation == "AC" {
                    displayLabel.text = "0"
                    didFinishTyping = true
                    isDecimalPointAdded = false
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
        }
    }

}

