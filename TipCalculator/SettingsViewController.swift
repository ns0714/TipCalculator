//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Neha Samant on 9/14/16.
//  Copyright © 2016 Neha Samant. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipDefaultLabel: UILabel!
    @IBOutlet weak var spiltCountLabel: UILabel!
    @IBOutlet weak var spiltControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultTip(15)
        setDefaultSplitBy(0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDefaultTip(tip : Int){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tip, forKey: "tip")
        defaults.synchronize()
    }
    
    func setDefaultSplitBy(split : Int){
        let defaults = NSUserDefaults.standardUserDefaults()
         defaults.setInteger(split, forKey: "splitBy")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sliderValueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        tipLabel.text = "\(currentValue)%"
        setDefaultTip(currentValue)
    }
    
    @IBAction func spiltValueChanged(sender: AnyObject) {
        spiltCountLabel.text =  String(spiltControl.selectedSegmentIndex)
        print("what is the value" ,spiltControl.selectedSegmentIndex)
        setDefaultSplitBy(spiltControl.selectedSegmentIndex)
    }
}
