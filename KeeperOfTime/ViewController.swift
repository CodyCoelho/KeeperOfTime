//
//  ViewController.swift
//  KeeperOfTime
//
//  Created by 100136905 on 2015-04-15.
//  Copyright (c) 2015 100136905. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variable declaration
    var milliseconds:Float = 0.000;
    var stopTitle: NSString = "Stop"
    var isStopped: Bool = false
    
    //intialize start time to false
    var startTime = false
    
    
    //label bounds
    let titleLabelRect = CGRectMake(50, 60, UIScreen.mainScreen().bounds.size.width - 20, 44)
    let timerLabelRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 50, 120, 220, 44)
    let lapLabelRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 50, 300, 220, 44)
    
    //button bounds
    let startButtonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 120, 180, 100, 44)
    let stopButtonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 + 20, 180, 100, 44)
    let lapButtonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2  - 50, 250, 100, 44)
    
    
    //title label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Papyrus", size:35)
        return label
        }()
    
    //timer label
    var timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:44)
        return label
        }()
    
    //lap label
    var lapLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:25)
        return label
        }()
    
    //start button
    var startButton: UIButton = {
        let button = UIButton()
        return button
        }()
    
    //stop button
    var stopButton: UIButton = {
        let button = UIButton()
        return button
        }()
    
    //lap button
    var lapButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label frames inheriate set label bounds
        titleLabel.frame = titleLabelRect
        timerLabel.frame = timerLabelRect
        lapLabel.frame = lapLabelRect
        
        //set text properties on labels
        titleLabel.text = "Keeper Of Time"
        timerLabel.text = "0.000"
        lapLabel.text = ""
        
        //add labels to the view
        self.view.addSubview(titleLabel)
        self.view.addSubview(timerLabel)
        self.view.addSubview(lapLabel)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        //set properties for buttons
        startButton.frame = startButtonRect
        startButton.setTitle("Start", forState: UIControlState.Normal)
        startButton.addTarget(self, action: "startTimer", forControlEvents: UIControlEvents.TouchUpInside)
        startButton.backgroundColor = UIColor.redColor()
        self.view.addSubview(startButton)
        
        stopButton.frame = stopButtonRect
        stopButton.setTitle(stopTitle, forState: UIControlState.Normal)
        stopButton.addTarget(self, action: "stopTimer", forControlEvents: UIControlEvents.TouchUpInside)
        stopButton.backgroundColor = UIColor.redColor()
        self.view.addSubview(stopButton)
        
        lapButton.frame = lapButtonRect
        lapButton.setTitle("Lap", forState: UIControlState.Normal)
        lapButton.addTarget(self, action: "setLap", forControlEvents: UIControlEvents.TouchUpInside)
        lapButton.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(lapButton)
        
    }
    
    func startTimer() {
        
        //starts the timer
        isStopped = false
        stopTitle = "Stop"
        stopButton.setTitle(stopTitle, forState: UIControlState.Normal)
        if (!startTime){
            NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: "updateTimerLabel", userInfo: nil, repeats: true)
            startTime = true
        }
    }
    
    func stopTimer() {
        
        //sets the stopped flag
        isStopped = true
        
        //Stops the timer and sets the stop button until the restart button
        switch (stopTitle) {
        case "Stop":
            if (milliseconds > 0.000) {
                stopTitle = "Reset"
                stopButton.setTitle(stopTitle, forState: UIControlState.Normal)
            }
            break
        case "Reset":
            timerLabel.text = "0.000"
            milliseconds = 0.000
            stopTitle = "Stop"
            stopButton.setTitle(stopTitle, forState: UIControlState.Normal)
            lapLabel.text = ""
        default:
            break
        }
    }
    
    func setLap(){
        //sets the lap label to the value of the timer label
        if(startTime == true){
            lapLabel.text = timerLabel.text
        }
    }
    
    
    func updateTimerLabel() {
        
        //check to see if the timer has been stopped and if it isn't set it will update the timer label
        if (!isStopped) {
            milliseconds += 0.001
            timerLabel.text = NSString(format:"%.3f", milliseconds)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

