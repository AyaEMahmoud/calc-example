//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Aya Mahmoud on 23/03/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var intermediateOperation: (number: Double, operation: String)?
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "AC" {
                return  0
            } else if symbol == "=" {
                if let tuple = intermediateOperation {
                    return preformOperation(operandAndOperation: (firstOprand: tuple.number,
                                                                  operationSymbol: tuple.operation),
                                     secondOperand: n)
                }
            } else {
                intermediateOperation = (number: n, operation: symbol)
                return n
            }
        }
        return nil
    }
    
    func preformOperation(operandAndOperation: (firstOprand: Double,
                                                operationSymbol: String),
                          secondOperand: Double) -> Double {
        switch operandAndOperation.operationSymbol {
        case "+":
            return operandAndOperation.firstOprand + secondOperand
        case "-":
            return operandAndOperation.firstOprand - secondOperand
        case "÷":
            return operandAndOperation.firstOprand / secondOperand
        default:
            return operandAndOperation.firstOprand * secondOperand
        }
    }
}
