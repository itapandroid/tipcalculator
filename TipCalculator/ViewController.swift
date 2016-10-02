//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tapan Patel on 9/29/16.
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipPercentageView: UISegmentedControl!
    @IBOutlet weak var tipView: UILabel!
    @IBOutlet weak var totalView: UILabel!
    @IBOutlet weak var userInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //end editing when clicked elsewhere on the screen
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if((userDefaults.object(forKey: "default_tip_index")) != nil){
            tipPercentageView.selectedSegmentIndex = userDefaults.object(forKey: "default_tip_index") as! Int
            calculateTip(tipPercentageView)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userInputField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentage = [0.15, 0.20, 0.25]
        
        let bill = Double(userInputField.text!) ?? 0
        let tip = bill * tipPercentage[tipPercentageView.selectedSegmentIndex]
        let total = bill + tip
        
        tipView.text = String(format: "%.2f", tip)
        totalView.text = String(format: "%.2f", total)
    }
    
    //Private funcitons
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

