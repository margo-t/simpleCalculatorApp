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
    
    var firstValue = ""
    var secondValue = ""
    var result = ""
    
    
    enum Operation: String {
        
        case addition = "+"
        case substraction = "-"
        case multiplication = "*"
        case division = "/"
        case clear = "clear"
        }

    
    
    @IBAction func numberTouched(sender: UIButton){
        currentNumber += "\(sender.tag)"
        terminalView.text = currentNumber
    }
    
    //@IBAction func onDivision
    
    func processOperation(operation: Operation){
        
        if currentOperation != Operation.clear{
            
            //entering operators twice without entering a number in between
            if currentNumber != "" {
                firstValue = currentNumber
                currentNumber = ""
                
                if currentOperation == Operation.addition {
                    result = "\(Double(secondValue)! + Double(firstValue)!)"
                }
                else if currentOperation == Operation.substraction {
                    result = "\(Double(secondValue)! - Double(firstValue)!)"
                }
                else if currentOperation == Operation.division {
                    result = "\(Double(secondValue)! / Double(firstValue)!)"
                }
                else if currentOperation == Operation.multiplication {
                    result = "\(Double(secondValue)! * Double(firstValue)!)"
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

