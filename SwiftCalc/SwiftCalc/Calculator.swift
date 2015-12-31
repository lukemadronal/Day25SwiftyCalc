//
//  Calculator.swift
//  SwiftCalc
//
//  Created by Luke Madronal on 11/9/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//

import UIKit

class Calculator: NSObject {
    
    static let sharedInstance = Calculator()
    
    var currentNumber = Double()
    var prevNumber = Double()
    var newNumber = Double()
    var functionsNotPressed = true
    var functionAfterEqual = false;
    var lastFunctionPressed = "";
    var functionContinuation = false
    var numsReset = true;
    var checkClear = true;
    
    //MARK: - Calculator Methods
    
    func percentKey(currentlyDisplayedNumber: String) ->String {
        currentNumber = Double(currentlyDisplayedNumber)!/(100)
        return String(currentNumber)
    }
    
    func plusMinusKey(currentlyDisplayedNumber: String) ->String {
        currentNumber = Double(currentlyDisplayedNumber)!*(-1)
        return String(currentNumber)
    }
    func decimalKey(currentlyDisplayedNumber: String) ->String {
        if !currentlyDisplayedNumber.containsString(".") {
            return currentlyDisplayedNumber + "."
        } else if currentlyDisplayedNumber == "0.0" {
            return "0."
        }
        return currentlyDisplayedNumber
    }
    
    func numberButtonPressed(currentlyDisplayedNumber: String){
        if (currentlyDisplayedNumber == "0.") {
            checkClear = false
        } else {
            currentNumber = Double(currentlyDisplayedNumber)!
        }
        functionsNotPressed = true
        functionAfterEqual = false
    }
    
    func displayNumberButtonPresses(input: String, currentlyDisplayedNumber: String) -> String  {
        if currentlyDisplayedNumber == "0." {
            checkClear = false
        }
        if(checkClear) {
            checkClear=false;
            return input
        } else {
            return currentlyDisplayedNumber + input
        }
    }
    
    func newFunction(mathSymbol: String, currentlyDisplayedNumber: String) ->String {
        if (functionsNotPressed) {
            if (functionAfterEqual) {
                prevNumber = Double(currentlyDisplayedNumber)!
                lastFunctionPressed = mathSymbol
            } else {
                calculateFunctions(lastFunctionPressed, currentlyDisplayedNumber:currentlyDisplayedNumber)
                prevNumber = newNumber
                if (numsReset) {
                    prevNumber = currentNumber
                }
            }
            functionsNotPressed = false
            numsReset = false
            checkClear = true
            lastFunctionPressed = mathSymbol
            return "\(newNumber)"
        } else {
            return "zero"
        }
    }
    
    func calculateFunctions(currentOperator: String, currentlyDisplayedNumber: String) {
        if (currentNumber != 0 && prevNumber != 0) {
            switch currentOperator {
            case "+":
                if(numsReset) {
                    prevNumber=currentNumber;
                }
                newNumber = currentNumber + prevNumber
            case "X":
                if(numsReset) {
                    prevNumber=1;
                }
                newNumber = prevNumber * currentNumber
            case "−":
                if(numsReset) {
                    newNumber = currentNumber
                } else {
                    newNumber = prevNumber - currentNumber
                }
            case "÷":
                if(numsReset) {
                    prevNumber = 1
                    newNumber = currentNumber / 1
                } else {
                    newNumber = prevNumber / currentNumber
                }
            case "+/-":
                newNumber *= -1
            default:
                print("defaulting")
            }
        }
    }
    
    func clear() {
        prevNumber = 0
        newNumber = 0
        currentNumber = 0
        numsReset=true;
        functionsNotPressed = true;
        functionContinuation = false
        checkClear = true
    }
    
    func equalsButton(currentlyDisplayedNumber: String) -> String {
        calculateFunctions(lastFunctionPressed, currentlyDisplayedNumber: currentlyDisplayedNumber)
        functionsNotPressed = true
        functionAfterEqual = true;
        checkClear = true
        prevNumber = 0
        return "\(newNumber)"
    }
}
