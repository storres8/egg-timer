//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // titleLabel.text is mainly used to configure the text
        // of the button for each state
        // can also be used to modify the font
        //print(sender.titleLabel!.text!)
        
        // current title is read-only is used to get the title
        // that is currently being displayed
        let hardness = sender.currentTitle!.lowercased()
        print(hardness)
        
        if hardness == "soft" {
            print(softTime)
        } else if hardness == "medium" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
    }
    
}
