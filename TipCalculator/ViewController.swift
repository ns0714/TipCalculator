//
//  ViewController.swift
//  TipCalculator
//
//  Created by Neha Samant on 9/11/16.
//  Copyright © 2016 Neha Samant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipValue: Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        getDefaultValues()
    }
    
    func getDefaultValues(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("tip")
        print(tipValue)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        getDefaultValues()
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
    }
}

