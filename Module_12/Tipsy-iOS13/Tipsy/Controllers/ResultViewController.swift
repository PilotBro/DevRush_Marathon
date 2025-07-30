//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Никита Грицунов on 29.07.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var result = 0.0
    var numberOfPeople = 2
    var tipPersentage = 10
   
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", result)
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPersentage)% tip."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
