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
    @IBOutlet weak var spiltTotal: UILabel!
    @IBOutlet weak var spiltLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        getDefaultValue()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        billField.becomeFirstResponder()
        getDefaultValue()
    }
   
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func getDefaultValue(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercent = defaults.integerForKey("tip")
        let splitValue = defaults.integerForKey("splitBy")
        tipLabel.text = "Tip(\(tipPercent)%)"
        spiltLabel.text = String(format: "Split (\(Int(splitValue)))")
    }

    @IBAction func calculateTip(sender: AnyObject) {
        calculateTip()
    }
    
    func calculateTip(){
        
        let bill = Double(billField.text!) ?? 0
        let tipPercent = NSUserDefaults.standardUserDefaults().integerForKey("tip")
        let tip = (bill * Double(tipPercent))/100
        let total = bill + tip
        
        tipLabel.text = "Tip(\(tipPercent)%)"
        tipValueLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
        
        let splitBy = Double(NSUserDefaults.standardUserDefaults().integerForKey("splitBy"))
        if(splitBy != 0){
            let splitAmount = total/splitBy
            spiltLabel.text = String(format: "Split (\(Int(splitBy)))")
            spiltTotal.text = String(format: "$%0.2f", splitAmount)
        }else {
            spiltTotal.text = String(format: "$%0.2f", total)
        }
    }
}

