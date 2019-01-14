//
//  VIPController.swift
//  GTATimera
//
//  Created by Mark Pearson on 23/04/2016.
//  Copyright © 2016 Mark Pearson. All rights reserved.
//

import UIKit

class VIPController: UIViewController {
    
    // disable rotation
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    var ticker = NSTimer()
    var startTime = NSDate()
    var duration = 0
    var threeMins = 180
    var mainTickerBool = false
    var vipWorkBool = false
    var doRunTimers = false
    var buttonPressed = 9
    
    var count = 0
    
    var timeRunning = false
    
    // VIP Work labels
    @IBOutlet weak var hostileTakeoverLabel: UILabel!
    @IBOutlet weak var assetRecoveryLabel: UILabel!
    @IBOutlet weak var executiveDeathmatchLabel: UILabel!
    @IBOutlet weak var executiveSearchLabel: UILabel!
    @IBOutlet weak var sightseerLabel: UILabel!
    @IBOutlet weak var piracyPreventionLabel: UILabel!
    
    // VIP Challenges labels
    @IBOutlet weak var autoBuyoutLabel: UILabel!
    @IBOutlet weak var durDilligenceLabel: UILabel!
    @IBOutlet weak var mostWantedLabel: UILabel!
    @IBOutlet weak var point2PointLabel: UILabel!
    @IBOutlet weak var courierServiceLabel: UILabel!
    @IBOutlet weak var marketManipulationLabel: UILabel!
    
    
    class timerBools {
        var zero = false
        var one = false
        var two = false
        var three = false
        var four = false
        var five = false
    }
    var VipworkBools = timerBools()
    var vipChallengesBools = timerBools()
    
    class setTimersStart {
        var zero = NSDate()
        var one = NSDate()
        var two = NSDate()
        var three = NSDate()
        var four = NSDate()
        var five = NSDate()
    }
    var VipworkTimers = setTimersStart()
    var VipChallengesTimers = setTimersStart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // VIP Work buttons
    @IBAction func hostileTakeover(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 0
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipworkTimers.zero = NSDate()
        startTimers()
        
    }
    @IBAction func assetRecovery(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 1
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipworkTimers.one = NSDate()
        startTimers()
        
    }
    @IBAction func executiveDeathmatch(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 2
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipworkTimers.two = NSDate()
        startTimers()
        
    }
    @IBAction func executiveSearch(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 3
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipworkTimers.three = NSDate()
        startTimers()
        
    }
    @IBAction func sightseer(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 4
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipworkTimers.four = NSDate()
        startTimers()
    }
    @IBAction func piracyPrevention(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 5
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipworkTimers.five = NSDate()
        startTimers()
    }
    
    // VIP Challenges buttons
    @IBAction func autoBuyout(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 6
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipChallengesTimers.zero = NSDate()
        startTimers()
    }
    @IBAction func dueDilligence(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 7
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipChallengesTimers.one = NSDate()
        startTimers()
    }
    @IBAction func mostWanted(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 8
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipChallengesTimers.two = NSDate()
        startTimers()
    }
    @IBAction func point2Point(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 9
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipChallengesTimers.three = NSDate()
        startTimers()
    }
    @IBAction func courierService(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 10
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipChallengesTimers.four = NSDate()
        startTimers()
    }
    @IBAction func marketManipulation(sender: AnyObject) {
        if mainTickerBool == false {
            startMainTicker()
        }
        if timeRunning == false {
            timeRunning = true
        }
        buttonPressed = 11
        if doRunTimers == false {
            startTime = NSDate()
        }
        doRunTimers = true
        VipChallengesTimers.five = NSDate()
        startTimers()
    }
    
    
    
    // This is the main ticker. Constantly updating.
    func startMainTicker() {
        ticker = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(startTimers), userInfo: nil, repeats: true)
        mainTickerBool = true
    }
    
    // This runs from main ticker. Constantly refreshing.
    func startTimers() {
        
        if timeRunning == false {
            startTime = NSDate()
        } else {
            let elapsedTime = NSDate().timeIntervalSinceDate(startTime)
            duration = Int(elapsedTime)
            print(threeMins - duration)
            if ((threeMins - duration) == 0) {
                timeRunning = false
            }
        }
        
        switch buttonPressed {
        case 0:
            VipworkBools.zero = true
        case 1:
            VipworkBools.one = true
        case 2:
            VipworkBools.two = true
        case 3:
            VipworkBools.three = true
        case 4:
            VipworkBools.four = true
        case 5:
            VipworkBools.five = true
        case 6:
            vipChallengesBools.zero = true
        case 7:
            vipChallengesBools.one = true
        case 8:
            vipChallengesBools.two = true
        case 9:
            vipChallengesBools.three = true
        case 10:
            vipChallengesBools.four = true
        case 11:
            vipChallengesBools.five = true
        default:
            "No timers"
        }
        
        var piracyElapsedInt = 0
        var hostileElapsedInt = 0
        var assetElapsetInt = 0
        var executiveElapsedInt = 0
        var executiveSearchElapsedInt = 0
        var sightseerElapsedInt = 0
        
        if (VipworkBools.zero == false && doRunTimers == true) {
            getTime(hostileTakeoverLabel)
        }
        
        if VipworkBools.zero == true {
            let hostileElapsed = NSDate().timeIntervalSinceDate(VipworkTimers.zero)
            hostileElapsedInt = 600 - Int(hostileElapsed)
            getTimeCustom(hostileTakeoverLabel, time: hostileElapsedInt)
            if (hostileElapsedInt < 1) {
                VipworkBools.zero = false
                print(VipworkBools.zero)
                print(hostileElapsedInt)
                print("doRunTimers = \(doRunTimers)")
            }
        }
    
        if VipworkBools.one == false && doRunTimers == true {
            getTime(assetRecoveryLabel)
        } else if VipworkBools.one == true {
            let assetElapsed = NSDate().timeIntervalSinceDate(VipworkTimers.one)
            assetElapsetInt = 600 - Int(assetElapsed)
            assetRecoveryLabel.text = String("\(assetElapsetInt)")
            getTimeCustom(assetRecoveryLabel, time: assetElapsetInt)
        }
        
        if VipworkBools.two == false && doRunTimers == true {
            getTime(executiveDeathmatchLabel)
        } else if VipworkBools.two == true {
            let executiveElapsed = NSDate().timeIntervalSinceDate(VipworkTimers.two)
            executiveElapsedInt = 600 - Int(executiveElapsed)
            executiveDeathmatchLabel.text = String("\(executiveElapsedInt)")
            getTimeCustom(executiveDeathmatchLabel, time: executiveElapsedInt)
        }
        
        if VipworkBools.three == false && doRunTimers == true {
            getTime(executiveSearchLabel)
        } else if VipworkBools.three == true{
            let executiveSearchElapsed = NSDate().timeIntervalSinceDate(VipworkTimers.three)
            executiveSearchElapsedInt = 600 - Int(executiveSearchElapsed)
            executiveSearchLabel.text = String("\(executiveSearchElapsedInt)")
            getTimeCustom(executiveSearchLabel, time: executiveSearchElapsedInt)
        }
        
        
        if VipworkBools.four == false && doRunTimers == true {
            getTime(sightseerLabel)
        } else if VipworkBools.four == true{
            let sighseerElapsed = NSDate().timeIntervalSinceDate(VipworkTimers.four)
            sightseerElapsedInt = 600 - Int(sighseerElapsed)
            sightseerLabel.text = String("\(sightseerElapsedInt)")
            getTimeCustom(sightseerLabel, time: sightseerElapsedInt)
        }
        
        if VipworkBools.five == false && doRunTimers == true {
            getTime(piracyPreventionLabel)
        } else if VipworkBools.five == true {
            let piracyElapsed = NSDate().timeIntervalSinceDate(VipworkTimers.five)
            piracyElapsedInt = 600 - Int(piracyElapsed)
            piracyPreventionLabel.text = String("\(piracyElapsedInt)")
            getTimeCustom(piracyPreventionLabel, time: piracyElapsedInt)
        }
        var autoBuyoutInt = 0
        var dueDilligenceInt = 0
        var mostWantedInt = 0
        var point2PointInt = 0
        var courierServiceInt = 0
        var marketManipulationInt = 0
        
        //VIP Challenges
        if vipChallengesBools.zero == false && doRunTimers == true {
            getTime(autoBuyoutLabel)
        } else if vipChallengesBools.zero == true {
            let theDate = NSDate().timeIntervalSinceDate(VipChallengesTimers.zero)
            autoBuyoutInt = 600 - Int(theDate)
            getTimeCustom(autoBuyoutLabel, time: autoBuyoutInt)
        }
        
        if vipChallengesBools.one == false && doRunTimers == true {
            getTime(durDilligenceLabel)
        } else if vipChallengesBools.one == true {
            let theDate = NSDate().timeIntervalSinceDate(VipChallengesTimers.one)
            dueDilligenceInt = 600 - Int(theDate)
            getTimeCustom(durDilligenceLabel, time: dueDilligenceInt)
        }
        
        if vipChallengesBools.two == false && doRunTimers == true {
            getTime(mostWantedLabel)
        } else if vipChallengesBools.two == true {
            let theDate = NSDate().timeIntervalSinceDate(VipChallengesTimers.two)
            mostWantedInt = 600 - Int(theDate)
            getTimeCustom(mostWantedLabel, time: mostWantedInt)
        }
        
        if vipChallengesBools.three == false && doRunTimers == true {
            getTime(point2PointLabel)
        } else if vipChallengesBools.three == true {
            let theDate = NSDate().timeIntervalSinceDate(VipChallengesTimers.three)
            point2PointInt = 600 - Int(theDate)
            getTimeCustom(point2PointLabel, time: point2PointInt)
        }
        
        if vipChallengesBools.four == false && doRunTimers == true {
            getTime(courierServiceLabel)
        } else if vipChallengesBools.four == true {
            let theDate = NSDate().timeIntervalSinceDate(VipChallengesTimers.four)
            courierServiceInt = 600 - Int(theDate)
            getTimeCustom(courierServiceLabel, time: courierServiceInt)
        }
        
        if vipChallengesBools.five == false && doRunTimers == true {
            getTime(marketManipulationLabel)
        } else if vipChallengesBools.five == true {
            let theDate = NSDate().timeIntervalSinceDate(VipChallengesTimers.five)
            marketManipulationInt = 600 - Int(theDate)
            getTimeCustom(marketManipulationLabel, time: marketManipulationInt)
        }
        
        if ((threeMins - duration) < 1) {
            doRunTimers = false
            timeRunning = false
        }
        
        buttonPressed = 20
        
    }
    
    func getTime(theLabel: UILabel) {
        let temp = threeMins - duration
        let minutes = temp / 60
        let seconds = temp % 60
        if minutes < 10 && seconds < 10 {
        theLabel.text = String("0\(minutes):0\(seconds)")
        } else if seconds < 10 {
        theLabel.text = String("\(minutes):0\(seconds)")
        } else if minutes < 10 && seconds > 10 {
        theLabel.text = String("0\(minutes):\(seconds)")
        } else {
            theLabel.text = "Missing"
        }
    }
    func getTimeCustom(theLabel: UILabel, time: Int) {
        let minutes = time / 60
        let seconds = time % 60
        if minutes < 10 && seconds < 10 {
            theLabel.text = String("0\(minutes):0\(seconds)")
        } else if seconds < 10 {
            theLabel.text = String("\(minutes):0\(seconds)")
        } else if minutes < 10 && seconds > 10 {
            theLabel.text = String("0\(minutes):\(seconds)")
        } else {
            theLabel.text = "Missing"
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
}