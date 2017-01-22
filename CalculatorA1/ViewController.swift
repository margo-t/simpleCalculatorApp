//
//  ViewController.swift
//  CalculatorA1
//
//  Created by Margo T on 2017-01-16.
//  Copyright © 2017 margot.centennial. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var terminalView: UILabel!
    
    
    var currentNumber = ""
    var currentOperation = Operation.clear
    
    var firstValue = "0"
    var secondValue = "0"
    var result = ""
    
    
    enum Operation: String {
        
        case addition = "+"
        case substraction = "-"
        case multiplication = "*"
        case division = "/"
        case clear = "clear"
        case clean = "clean"
        }
    

    // Number touched Actions
    
    @IBAction func numberTouched(sender: UIButton){
        currentNumber += "\(sender.tag)"
        terminalView.text = currentNumber
    }
    
    
    // Operation Actions
    
    @IBAction func onAddition(sender: UIButton){
        processOperation(operation: .addition)
        printAllInstances()
    }
    
    @IBAction func onSubstraction(sender: UIButton){
        processOperation(operation: .substraction)
        printAllInstances()
    }
    @IBAction func onMultiplication(sender: UIButton){
        processOperation(operation: .multiplication)
        printAllInstances()
    }
    @IBAction func onDivision(sender: UIButton){
        processOperation(operation: .division)
        printAllInstances()
    }
    
    @IBAction func onEqual(sender: UIButton){
        processOperation(operation: currentOperation)
        printAllInstances()
    }
    
    @IBAction func onClean(sender: UIButton){
        currentNumber = ""
        firstValue = "0"
        secondValue = "0"
        result = ""
        terminalView.text = "0"
        currentOperation = Operation.clear
        printAllInstances()
    }
    
    func printAllInstances(){
        
        print("currentNumber:"+currentNumber)
        print("firstValue:"+firstValue)
        print("secondValue:"+secondValue)
        print("result:"+result)
        print("terminalView:"+terminalView.text!)
        print("--------------------------------")
        }
    
    func processOperation(operation: Operation){
        
        //TODO: fix if only one number was entered
        
        if currentOperation != Operation.clear{
            
            //entering operators twice without entering a number in between
            if currentNumber != "" {
                firstValue = currentNumber
                currentNumber = ""
                
                if currentOperation == Operation.addition {
                    result = "\((Double(secondValue)! + Double(firstValue)!).format)"
                }
                else if currentOperation == Operation.substraction {
                    result = "\((Double(secondValue)! - Double(firstValue)!).format)"
                }
                else if currentOperation == Operation.division {
                    result = "\((Double(secondValue)! / Double(firstValue)!).format)"
                }
                else if currentOperation == Operation.multiplication {
                    result = "\((Double(secondValue)! * Double(firstValue)!).format)"
                }
                
                secondValue = result
                terminalView.text = result
                }
            
            currentOperation = operation
            }
        
        else {
            //first time operator has been pressed
            secondValue = currentNumber
            currentNumber = ""
            currentOperation = operation
            
        
            }
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
    extension Double {
        var format: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
