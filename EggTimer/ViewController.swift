//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

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
    var initial:Int? = nil
    var timer = Timer()
    
    var player: AVAudioPlayer?
    
    func playsound(){
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

           do {
               try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
               try AVAudioSession.sharedInstance().setActive(true)

               /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

               /* iOS 10 and earlier require the following line:
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

               guard let player = player else { return }

               player.play()

           } catch let error {
               print(error.localizedDescription)
           }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!.lowercased()
        
        secondsRemaining = eggTimes[hardness]!
        initial = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            
            let numerator = Float(initial!) - Float(secondsRemaining)
            
            let final = numerator / Float(initial!)
            
            
            progressBar.progress = final
            
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            timerDone.text = "DONE!"
            playsound()
        }
    }
}
