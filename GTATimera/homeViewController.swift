//
//  FirstViewController.swift
//  GTATimera
//
//  Created by Mark Pearson on 23/04/2016.
//  Copyright © 2016 Mark Pearson. All rights reserved.
//

import UIKit

var twtFrHToggleBool = false
var globals1 = Countdown()
var globals2 = Countdown()
var globals3 = Countdown()
var carSell = Countdown()
var freeModeTimer = Countdown()
var vipTimer = Countdown()
var missionMetTimer = Countdown()

class homeViewController: UIViewController {
    
    // disable rotation
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // Declare local variables
    let todaydate = NSDate()
    var gameTimeDay = NSDate()
    let gameTime = NSDate()
    var gameTimeMins = 0
    var gameTimeHours = 0
    var localCount = NSTimer()
    
    // declare labels
    @IBOutlet weak var gameTimerDayLabel: UILabel!
    @IBOutlet weak var gameTimerTimeLabel: UILabel!
    @IBOutlet weak var gameTimerAmpmLabel: UILabel!
    @IBOutlet weak var timer1Label: UILabel!
    @IBOutlet weak var timer2Label: UILabel!
    @IBOutlet weak var timer3Label: UILabel!
    @IBOutlet weak var carSellLabel: UILabel!
    @IBOutlet weak var METLabel: UILabel!
    @IBOutlet weak var freeModeLabel: UILabel!
    @IBOutlet weak var VIPLabel: UILabel!
    
    // declare buttons and call functions
    @IBOutlet weak var buttonTimer1: UIButton!
    @IBAction func timer1(sender: AnyObject) {
        if globals1.timerRunning == true
        {
            globals1.count = globals1.initial
            globals1.timerRunning = false
            globals1.timer.invalidate()
        }
        globals1.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.timerRunning), userInfo: nil, repeats: true)
        buttonTimer1.userInteractionEnabled = false
    }
    @IBOutlet weak var buttonTimer2: UIButton!
    @IBAction func timer2(sender: AnyObject) {
        if globals2.timerRunning == true
        {
            globals2.count = globals2.initial
            globals2.timerRunning = false
            globals2.timer.invalidate()
        }
        globals2.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.timerRunning2), userInfo: nil, repeats: true)
        buttonTimer2.userInteractionEnabled = false
    }
    @IBOutlet weak var buttonTimer3: UIButton!
    @IBAction func timer3(sender: AnyObject) {
        if globals3.timerRunning == true
        {
            globals3.count = globals3.initial
            globals3.timerRunning = false
            globals3.timer.invalidate()
        }
        globals3.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.timerRunning3), userInfo: nil, repeats: true)
        buttonTimer3.userInteractionEnabled = false
    }
    @IBOutlet weak var buttonCarSell: UIButton!
    @IBAction func carSellTimer(sender: AnyObject) {
        if carSell.timerRunning == true
        {
            carSell.timer.invalidate()
            carSell.timerRunning = false
        }
        carSell.count = 2880
        carSell.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.sellCarRunning), userInfo: nil, repeats: true)
        buttonCarSell.userInteractionEnabled = false
    }
    // MET
    @IBOutlet weak var buttonMissionTimer: UIButton!
    @IBAction func missionTimer(sender: AnyObject) {
        if missionMetTimer.timerRunning == true
        {
            missionMetTimer.timerRunning = false
            missionMetTimer.timer.invalidate()
        }
        missionMetTimer.count = 0
        missionMetTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.missionTimerRunning), userInfo: nil, repeats: true)
        buttonMissionTimer.userInteractionEnabled = false
    }
    
    @IBOutlet weak var buttonFreemode: UIButton!
    @IBAction func freemodeTimer(sender: AnyObject) {
        if freeModeTimer.timerRunning == true
        {
            freeModeTimer.timerRunning = false
            freeModeTimer.timer.invalidate()
        }
        freeModeTimer.count = 720
        freeModeTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.freemodeRunning), userInfo: nil, repeats: true)
        buttonFreemode.userInteractionEnabled = false
        
    }
    
    @IBOutlet weak var buttonVipTimer: UIButton!
    @IBAction func VIPTimer(sender: AnyObject) {
        if vipTimer.timerRunning == true
        {
            vipTimer.timerRunning = false
            vipTimer.timer.invalidate()
        }
        vipTimer.count = 43200
        vipTimer.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.vipRunning), userInfo: nil, repeats: true)
        buttonVipTimer.userInteractionEnabled = false
    }
    
    @IBAction func unwindSegue(sender: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimeZone.setDefaultTimeZone(NSTimeZone(name:"UTC")!)
        startTime()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(homeViewController.setCount1(_:)), name: "count1", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(homeViewController.setCount2(_:)), name: "count2", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(homeViewController.setCount3(_:)), name: "count3", object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // declare functions
    
    // game timer
    
    func printGameTime()
    {
        _ = NSDate()
        let today = todaydate
        var gameTimer = gameTime
        gameTimer = gameTimealgo()
        gameTimeDay = NSDate(timeIntervalSinceReferenceDate: today.timeIntervalSince1970 * 33)
        let timeFormatter = NSDateFormatter()
        let hourFormatter = NSDateFormatter()
        if twtFrHToggleBool == true {
            timeFormatter.dateFormat = "HH:mm a"
        } else {
            timeFormatter.dateFormat = "hh:mm a"
        }
        
        hourFormatter.dateFormat = "HH"
        var timerString = timeFormatter.stringFromDate(gameTimer)
        let hourString = hourFormatter.stringFromDate(gameTimer)
        let hour = Int(hourString)
        timerString = String(timerString.characters.dropLast(3))
        var timerStringampm = timeFormatter.stringFromDate(gameTimer)
        timerStringampm = String(timerStringampm.characters.dropFirst(5))
        let dayFormatter = NSDateFormatter()
        dayFormatter.dateFormat = "EEEE"
        let dayString = dayFormatter.stringFromDate(gameTimeDay)
        changeLabel(gameTimerTimeLabel, stringForLabel: timerString)
        changeLabel(gameTimerDayLabel, stringForLabel: dayString)
        changeLabel(gameTimerAmpmLabel, stringForLabel: timerStringampm)
    }
    func gameTimealgo() -> NSDate
    {
        let today = NSDate()
        let gameTime = NSDate(timeIntervalSinceReferenceDate: today.timeIntervalSince1970 * 30)
        return gameTime
    }
    func changeLabel(labelToChange: UILabel, stringForLabel: String)
    {
        labelToChange.text = stringForLabel
    }
    func startTime()
    {
        localCount = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(homeViewController.printGameTime), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func hToggle(sender: AnyObject) {
        if twtFrHToggleBool == false {
            twtFrHToggleBool = true
        } else {
            twtFrHToggleBool = false
        }
    }
    
    // timer 1
    func timerRunning()
    {
        globals1.timerRunning = true // boolRunning
        let minutes = (globals1.count / 60) % 60 // count
        let seconds = globals1.count % 60
        print("\(minutes):\(seconds)")
        globals1.count = globals1.count - 1
        timer1Label.text = setLabelToTimer(minutes, secs: seconds) // UILabel
        if (seconds <= 0 && minutes <= 0)
            
        {
            globals1.timer.invalidate()
        }
        buttonTimer1.userInteractionEnabled = true
    }
    
    // timer 2
    func timerRunning2()
    {
        print("Started")
        globals2.timerRunning = true
        let minutes = (globals2.count / 60) % 60;
        let seconds = globals2.count % 60;
        print("\(minutes):\(seconds)")
        globals2.count = globals2.count - 1
        timer2Label.text = setLabelToTimer(minutes, secs: seconds)
        if (seconds <= 0 && minutes <= 0)
        {
            globals2.timer.invalidate()
        }
        buttonTimer2.userInteractionEnabled = true
    }
    
    // timer 3
    func timerRunning3()
    {
        print("Started")
        globals3.timerRunning = true
        let minutes = (globals3.count / 60) % 60;
        let seconds = globals3.count % 60;
        print("\(minutes):\(seconds)")
        globals3.count = globals3.count - 1
        timer3Label.text = setLabelToTimer(minutes, secs: seconds)
        if (seconds <= 0 && minutes <= 0)
        {
            globals3.timer.invalidate()
        }
        buttonTimer3.userInteractionEnabled = true
    }
    
    // sell
    func sellCarRunning()
    {
        print("Started")
        carSell.timerRunning = true
        let minutes = (carSell.count / 60) % 60
        let seconds = carSell.count % 60
        print("\(minutes):\(seconds)")
        carSell.count = carSell.count - 1
        carSellLabel.text = setLabelToTimer(minutes, secs: seconds)
        if (seconds <= 0 && minutes <= 0)
        {
            carSell.timer.invalidate()
        }
        buttonCarSell.userInteractionEnabled = true
    }
    
    
    // MET
    func missionTimerRunning()
    {
        print("Started")
        missionMetTimer.timerRunning = true
        let hours = missionMetTimer.count / 3600
        let minutes = (missionMetTimer.count / 60) % 60
        let seconds = missionMetTimer.count % 60
        print("\(minutes):\(seconds)")
        missionMetTimer.count = missionMetTimer.count + 1
        METLabel.text = setLabelToTimerHours(hours, mins: minutes, secs: seconds)
        if (seconds < 0 && minutes <= 0)
        {
            missionMetTimer.timer.invalidate()
        }
        buttonMissionTimer.userInteractionEnabled = true
    }
    
    
    // Freemode
    func freemodeRunning()
    {
        print("Started")
        freeModeTimer.timerRunning = true
        let minutes = (freeModeTimer.count / 60) % 60;
        let seconds = freeModeTimer.count % 60;
        print("\(minutes):\(seconds)")
        freeModeTimer.count = freeModeTimer.count - 1
        freeModeLabel.text = setLabelToTimer(minutes, secs: seconds)
        if (seconds <= 0 && minutes <= 0)
        {
            freeModeTimer.timer.invalidate()
        }
        buttonFreemode.userInteractionEnabled = true
    }
    
    
    // VIP
    func vipRunning()
    {
        print("Started")
        vipTimer.timerRunning = true
        let hours = vipTimer.count / 3600
        let minutes = vipTimer.count / 60 % 60
        let seconds = vipTimer.count % 60
        print("\(hours):\(minutes):\(seconds)")
        vipTimer.count = vipTimer.count - 1
        VIPLabel.text = setLabelToTimerHours(hours, mins: minutes, secs: seconds)
        if (hours <= 0 && seconds <= 0 && minutes <= 0)
        {
            vipTimer.timer.invalidate()
        }
        buttonVipTimer.userInteractionEnabled = true
    }
    
    // timer to label
    func setLabelToTimer (mins: Int, secs: Int) -> String
    {
        let minString = String(format: "%02d", mins)
        let secString = String(format: "%02d", secs)
        let returnString = ("\(minString):\(secString)")
        return returnString
    }
    func setLabelToTimerHours (hours: Int, mins: Int, secs: Int) -> String
    {
        let hourString = String(format: "%02d", hours)
        let minString = String(format: "%02d", mins)
        let secString = String(format: "%02d", secs)
        let returnString = ("\(hourString):\(minString):\(secString)")
        return returnString
    }
    
    
    // Set the Custom Timer labels to slider values
    func setCount1(notification: NSNotification) {
        
        print("Received Notification 1")
        let minutes = (globals1.initial / 60) % 60 // count
        let seconds = globals1.initial % 60
        print("\(minutes):\(seconds)")
        globals1.count = globals1.initial - 1
        timer1Label.text = setLabelToTimer(minutes, secs: seconds)
    }
    func setCount2(notification: NSNotification) {
        
        print("Received Notification 2")
        let minutes = (globals2.initial / 60) % 60 // count
        let seconds = globals2.initial % 60
        print("\(minutes):\(seconds)")
        globals2.count = globals2.initial - 1
        timer2Label.text = setLabelToTimer(minutes, secs: seconds)
    }
    func setCount3(notification: NSNotification) {
        
        print("Received Notification 3")
        let minutes = (globals3.initial / 60) % 60 // count
        let seconds = globals3.initial % 60
        print("\(minutes):\(seconds)")
        globals3.count = globals3.initial - 1
        timer3Label.text = setLabelToTimer(minutes, secs: seconds)
    }
    
    // Feed
    @IBOutlet weak var news1: UILabel!
    @IBOutlet weak var news2: UILabel!
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

