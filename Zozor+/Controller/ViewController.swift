//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let calculate = Calculate()
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Action
    // Number Button
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        if let number = Int(sender.currentTitle!) {
            calculate.addNewNumber(number)
            updateDisplay()
        }
    }
    
    //Operator Button return title value
    @IBAction func operatorButton(_ sender: UIButton) {
        addOperator(sender.currentTitle!)
    }
    
    //Equal Button
    @IBAction func equal() {
        textView.text = calculate.calculateTotal()
    }
    
    //AC Button to clear view
    @IBAction func clear(_ sender: UIButton) {
        calculate.clear()
        textView.text = "0"
    }
    
    //Decimal Button
    @IBAction func decimal(_ sender: UIButton) {
        addDecimal(sender.currentTitle!)
    }
    
    
    /// Alert message
    public func alertMessage(_ message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    /// Add operator
    private func addOperator(_ newOperator: String) {
        do {
            try calculate.addNewOperator(newOperator)
            updateDisplay()
        } catch ErrorMessage.cantAddOperator {
            alertMessage("Expression Incorrecte !")
        } catch {
            print("Error")
        }
    }
    
    // Add a decimal dot
    private func addDecimal(_ separator: String){
        if textView.text.contains(".") {
            alertMessage("You have already use the separator")
        } else {
            addOperator(separator)
        }
    }
    
    // Update display textView
    private func updateDisplay() {
        var text = ""
        for (i, stringNumber) in calculate.stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += calculate.operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
}
