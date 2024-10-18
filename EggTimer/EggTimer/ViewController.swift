//
//  ViewController.swift
//  EggTimer
//
//  Created by Abylkairkhan Sarsetayev on 19.10.2024.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {

    @IBOutlet weak var counterText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":5, "Medium":7, "Hard":12]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var progressStatus: Float?
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func update() {
        progressStatus = Float(secondsPassed) / Float(totalTime)
        progressBar.progress = progressStatus!
        
        if(self.secondsPassed < totalTime) {
            print("\(self.secondsPassed) seconds passed")
            self.secondsPassed += 1
        } else {
            timer.invalidate()
//            playSound()
        }
    }
    
    @IBAction func hardEggButton(_ sender: UIButton) {
        timer.invalidate()
        
        // Reset
        totalTime = eggTimes[hardness]!
        secondsPassed = 0
        progressStatus = 0.0
        
        // timer
        timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @IBAction func softEggButton(_ sender: UIButton) {
        
    }
    
    @IBAction func mediumEggButton(_ sender: UIButton) {
        
    }
    
}

