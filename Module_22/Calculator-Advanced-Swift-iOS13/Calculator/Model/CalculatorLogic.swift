//  CalculatorLogic.swift
//  Created by Никита Грицунов on 05.09.2025.
//  Copyright © 2025 London App Brewery. All rights reserved.

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (number: Double, calc: String)?
        
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    
    mutating func calculate(calcMethod: String) -> Double? {
        var result: Double = 0.0
        if let n = number {
            result = n
            switch calcMethod {
            case "AC":
                result = 0
            case "+/-":
                result *= -1
            case "%":
                result *= 0.01
            case "=":
                return performNumTwoCalculation(n2: n)
            default:
                intermediateCalculation = (number: n, calc: calcMethod)
            }
            
        }
        return result
    }
    private func performNumTwoCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.number,
           let operation = intermediateCalculation?.calc
        {
            switch operation {
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            case "-":
                return n1 - n2
            case "+":
                return n1 + n2
            default:
                fatalError("The operation passed in is does not match any of the cases.")
            }
        }
        return nil
        
    }
}
