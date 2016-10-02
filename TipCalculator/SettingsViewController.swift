//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Tapan Patel on 10/1/16.
//
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if((userDefaults.object(forKey: "default_tip_index")) != nil){
            defaultTipView.selectedSegmentIndex = userDefaults.object(forKey: "default_tip_index") as! Int
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipValueChanged(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard
        defaults.set(sender.selectedSegmentIndex, forKey: "default_tip_index")
        defaults.synchronize()
    }
}
