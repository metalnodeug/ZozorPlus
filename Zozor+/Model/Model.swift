//
//  Model.swift
//  CountOnMe
//
//  Created by metalnodeug on 31/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculate {
    
    // MARK: - Properties
    var index = 0
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    
    
    // MARK: - Methods
    //check if expression is correct
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    //Check if expression are correct
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    func addNewOperator(_ newOperator: String) throws {
        guard canAddOperator else {
            throw ErrorMessage.cantAddOperator
        }
        operators.append(newOperator)
        stringNumbers.append("")
    }
    
    //Clear TextField
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func calculateTotal() -> String{
        if !isExpressionCorrect {
            return "Expression incorrecte"
        }
        
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                switch operators[i] {
                case "+": total += number
                case "-": total -= number
                case "/": total /= number
                case "x": total *= number
                default: break
                }
                
            }
        }
        
        return String(total)
    }
    
    
}
