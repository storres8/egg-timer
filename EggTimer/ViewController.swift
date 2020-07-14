//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerDone: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // egg times are saved in secconds
    let eggTimes: [String : Int] = [
        "soft": 5,
        "medium": 420,
        "hard": 720
    ]
    
    var secondsRemaining:Int = 60
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!.lowercased()
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            timerDone.text = "DONE!"
        }
    }
}
