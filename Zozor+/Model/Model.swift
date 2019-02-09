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
    
    //Check if can add operator
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    //Check if can add decimal
    var canAddDecimal: Bool {
        if let expression = stringNumbers.last {
            if expression.contains(".") {
                return false
            }
        }
        return true
    }
    
    //Adding new number if it's possible
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
    
    // Ading New Number to the expression
    func addNewNumber(_ newNumber: String) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    // Calcultate total and return result
    func calculateTotal() -> String{
        if !isExpressionCorrect {
            return "Expression incorrecte"
        }
        
        var total: Double = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Double(stringNumber) {
                switch operators[i] {
                case "+": total += number
                case "-": total -= number
                case "/": total /= number
                case "x": total *= number
                default: break
                }
            }
        }
        // check if total is Integer for not display ".0"
        if total.rounded(.up) == total.rounded(.down) {
            print("C'est un entier")
            return String(Int(total))
        }
        print("C'est un nombre décimal")
        return String(total)
    }
}
