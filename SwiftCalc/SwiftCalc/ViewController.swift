//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Luke Madronal on 10/26/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel :UILabel!
    var calculator = Calculator.sharedInstance
    
    //MARK: - Interactivity Methods
    
    @IBAction func myButtonPressed(sender: UIButton) {
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.text = calculator.displayNumberButtonPresses(sender.titleLabel!.text!, currentlyDisplayedNumber: displayLabel.text!)
        calculator.numberButtonPressed(displayLabel.text!)
    }
    
    @IBAction func functionButtonedPressed(sender: UIButton) {
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.text = calculator.newFunction(sender.titleLabel!.text!, currentlyDisplayedNumber: displayLabel.text!)
    }
    
    @IBAction func clearButtonedPressed(sender: UIButton) {
        calculator.clear()
        displayLabel.text = "\(0)"
    }
    
    @IBAction func plusMinusButtonPressed() {
        displayLabel.text = calculator.plusMinusKey(displayLabel.text!)
    }
    
    @IBAction func decimalButtonPressed() {
        displayLabel.text = calculator.decimalKey(displayLabel.text!)
    }
    
    @IBAction func percentButtonPressed() {
        displayLabel.text = calculator.percentKey(displayLabel.text!)
    }
    
    @IBAction func equalsButtonedPressed(sender: UIButton) {
        displayLabel.text = calculator.equalsButton(displayLabel.text!)
        
    }
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        displayLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

