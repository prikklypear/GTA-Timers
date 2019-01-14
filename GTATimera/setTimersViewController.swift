//
//  SecondViewController.swift
//  GTATimera
//
//  Created by Mark Pearson on 23/04/2016.
//  Copyright © 2016 Mark Pearson. All rights reserved.
//

import UIKit

class setTimersViewController: UIViewController {
    
    // disable rotation
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBOutlet weak var timer1Label: UILabel!
    @IBOutlet weak var timer2Label: UILabel!
    @IBOutlet weak var timer3Label: UILabel!
    
    // Declare buttons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Slider 1
    @IBAction func timer1Count(sender: UISlider) {
        if (globals1.timerRunning == true)
        {
            globals1.timer.invalidate()
        }
        let currentValue = Int(sender.value) * 60
        let stringForLabel = String("\(currentValue / 60) minutes")
        timer1Label.text = stringForLabel
        globals1.initial = currentValue
        NSNotificationCenter.defaultCenter().postNotificationName("count1", object: nil, userInfo: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Slider 2
    @IBAction func timer2Cont(sender: UISlider) {
        if (globals2.timerRunning == true)
        {
            globals2.timer.invalidate()
        }
        let currentValue = Int(sender.value) * 60
        let stringForLabel = String("\(currentValue / 60) minutes")
        timer2Label.text = stringForLabel
        globals2.initial = currentValue
        NSNotificationCenter.defaultCenter().postNotificationName("count2", object: nil, userInfo: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Slider 3
    
    @IBAction func timer3Count(sender: UISlider) {
        if (globals3.timerRunning == true)
        {
            globals3.timer.invalidate()
        }
        let currentValue = Int(sender.value) * 60
        let stringForLabel = String("\(currentValue / 60) minutes")
        timer3Label.text = stringForLabel
        globals3.initial = currentValue
        NSNotificationCenter.defaultCenter().postNotificationName("count3", object: nil, userInfo: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

