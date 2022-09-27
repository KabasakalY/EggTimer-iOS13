//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var eggTimer : Float? = 60
    var timer = Timer()
    var percentage : Float? = 0
    var eggTimespercentage : Float? = 5
    
    func countDown(){
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter(){
        if eggTimer! > 0 {
            
            print(eggTimer!)
            
            eggTimer! = eggTimer!-1
            
            percentage = ((eggTimespercentage!-eggTimer!)/eggTimespercentage!)
            
            progressBar.progress=percentage!
            
            print(percentage)
            
            
        }
        else{
            timer.invalidate()
            changeLabel.text = "Done !"
        }
    }
    
   
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var changeLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        eggTimer = Float(eggTimes[hardness]!)
        eggTimespercentage = Float( eggTimes[hardness]!)
        
        
        countDown()
        
        
        
    }
    
}
