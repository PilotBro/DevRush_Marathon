//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    let resultVC = ResultViewController()
    
    var tip = 0.1
    var splitNumber = 0
    var result = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttonsArray = [zeroPctButton, tenPctButton, twentyPctButton]
        
        billTextField.endEditing(true)
        
        buttonsArray.forEach { button in
            if button?.currentTitle == sender.currentTitle {
                button?.isSelected = true
                
                let percentString = sender.currentTitle?.dropLast()
                guard let percent = Double(percentString ?? "") else { return }
                
                tip = percent / 100

            } else {
                button?.isSelected = false
            }
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = Int(sender.value)
        resultVC.numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billString = billTextField.text,
              var bill = Double(billString) else { return }
        bill = (bill * tip) + bill
        result = bill / Double(splitNumber)
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            if let resultVC = segue.destination as? ResultViewController {
                resultVC.numberOfPeople = splitNumber
                resultVC.result = result
                resultVC.tipPersentage = Int(tip * 100)
            }
        }
    }
}

