//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//Create a currency type enum
enum Currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    //Create a property named currency of type Currency
    var currency: Currency = Currency.cad
    
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        //early exit and unwrap text field
        guard let value = fromCurrencyTextField.text, let doubleNum = Double(value) else { return }
        //conver to double
        let converted = convert(doubleNum)
        //conver to text with two decimals
        toCurrencyTextField.text = String(format: "%.2f", converted)
    }
    
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        //Toggle this button's isSelected state
        sender.isSelected = !sender.isSelected
        //Toggle the mxn button's isSelected state
        mxnButton.isSelected = !mxnButton.isSelected
        //set the currency property to .cad
        currency = Currency.cad
        //Display the currency
        toCurrencyLabel.text = "Currency (CAD)"
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        //Toggle this button's isSelected state
        sender.isSelected = !sender.isSelected
        //Toggle the cad button's isSelected state
        cadButton.isSelected = !cadButton.isSelected
        //set the currency property to .mxn
        currency = Currency.mxn
        //Display the currency
        toCurrencyLabel.text = "Currency (MXN)"
        
 
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        if currency == Currency.cad {
            return  dollars * 1.33
        }else{
             return  dollars * 19.70
        }
    }
}

