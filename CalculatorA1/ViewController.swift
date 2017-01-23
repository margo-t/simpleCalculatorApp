//
//  ViewController.swift
//  CalculatorA1
//
//  Created by Margo Tereshchenkova on 2017-01-16.
//  Copyright © 2017 margot.centennial. All rights reserved.
//
//  Basic Calculator: perform simple operations with numbers

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var terminalView: UILabel!
    
    /////////////////////
    //Declare variables//
    /////////////////////
    
    var currentNumber = ""
    var currentOperation = Operation.clear
    var firstValue = "0"
    var secondValue = "0"
    var result = ""
    var float = false
    
    enum Operation: String {
        
        case addition = "+"
        case substraction = "-"
        case multiplication = "*"
        case division = "/"
        case clear = "clear"
        case clean = "clean"
        case power = "power"
        }
    
    /////////////////////////////////////////////
    // Activities when Number Button is pressed//
    /////////////////////////////////////////////
    
        //Simple digits
    @IBAction func numberTouched(sender: UIButton){
        if let symbol  = sender.currentTitle {
            if symbol == "." && !float {
                currentNumber += "."
                terminalView.text = currentNumber
                float=true
                printAllInstances()}

            else if symbol != "."{
        
        currentNumber += "\(sender.tag)"
        terminalView.text = currentNumber
            printAllInstances()
                }
            
        }
    }
        //Special numbers
    @IBAction func specialSymbol(sender: UIButton){
            if let mathSymbol  = sender.currentTitle {
            if mathSymbol == "π" {
                currentNumber = "\(M_PI)"
                terminalView.text = currentNumber
                float=true
            }
            else if mathSymbol == "e" {
                currentNumber = "\(M_E)"
                terminalView.text = currentNumber
                float=true
            }
            
            printAllInstances()
        }
    }
    
    /////////////////////////
    // Operation Activities//
    /////////////////////////
    
        //---Basic operations with two variables involved----
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
    
    @IBAction func onPower(sender: UIButton){
        processOperation(operation: .power)
        printAllInstances()
    }
    
    //----Clear all operations and Variables----
    @IBAction func onClean(sender: UIButton){
        currentNumber = ""
        firstValue = "0"
        secondValue = "0"
        result = ""
        float=false
        terminalView.text = "0"
        currentOperation = Operation.clear
        printAllInstances()
    }
    
        //----Calculate Percentage of entered number from Previous one
        //this operation requies different logic and requirements than in "processOperation"
    @IBAction func onPercentage(sender: UIButton){
        //processOperation(operation: .percentage)
        if secondValue != "0" && currentOperation != Operation.clear && currentNumber != ""{
            
            currentNumber = "\((Double(secondValue)! * (Double(currentNumber)! / 100)).format)"
            terminalView.text = currentNumber
            printAllInstances()
        }
    }
    
        //----Change sign of current value
        //Changes should be made only for one variable - 'currentNumber'
    @IBAction func onNegative(sender: UIButton){
        if currentNumber != "" || secondValue != "0"{
            if currentNumber != "" {
                currentNumber="\((Double(currentNumber)! * (-1)).format)"
                terminalView.text = currentNumber}
            else if secondValue != "0" {
                currentNumber="\((Double(secondValue)! * (-1)).format)"
                terminalView.text = currentNumber
            }
        }
        printAllInstances()
    }
    
        //----Take root of current value
        //Changes should be made only for one variable - 'currentNumber'
    @IBAction func onRoot(sender: UIButton){
        if currentNumber != "" || secondValue != "0"{
            if currentNumber != "" {
                currentNumber="\(sqrt(Double(currentNumber)!).format)"
                terminalView.text = currentNumber}
            else if secondValue != "0" {
                currentNumber="\(sqrt(Double(secondValue)!).format)"
                terminalView.text = currentNumber
            }
        }
        printAllInstances()
        }
    
    
    
    
    
    //logic to process operation with two variables
    func processOperation(operation: Operation){
        
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
                else if currentOperation == Operation.power {
                    result = "\((pow(Double(secondValue)!, Double(firstValue)!)).format)"
                }
                
                secondValue = result
                terminalView.text = result
                float=false
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
    
    
    
    //Keep log of all var updates
    func printAllInstances(){
        
        print("currentNumber:"+currentNumber)
        print("firstValue:"+firstValue)
        print("secondValue:"+secondValue)
        print("result:"+result)
        print("float: \(float)")
        print("terminalView:"+terminalView.text!)
        print("--------------------------------")
    }
    


}


    //How to remove decimal part from number: (solution found - http://stackoverflow.com/questions/31390466/swift-how-to-remove-a-decimal-from-a-float-if-the-decimal-is-equal-to-0)
    extension Double {
        var format: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
