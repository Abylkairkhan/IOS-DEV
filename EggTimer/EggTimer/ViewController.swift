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
    
    let eggTimes = ["Soft-Boiled":5, "Medium-Boiled":7, "Hard-Boiled":12]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var progressStatus: Float?
    
    var player: AVAudioPlayer!
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func update() {
        
        if(self.secondsPassed <= totalTime) {
            
            progressStatus = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = progressStatus!
            
            let remainingTime = totalTime - secondsPassed
                    
            let minutes = remainingTime / 60
            let seconds = remainingTime % 60
            
            counterText.text = String(format: "%d:%02d", minutes, seconds)
            
            print("\(self.secondsPassed) seconds passed")
            
            self.secondsPassed += 1
        } else {
            timer.invalidate()
            playSound()
        }
        
    }
    
    @IBAction func hardEggButton(_ sender: UIButton) {
        
        let hardness: String
        if let configTitle = sender.configuration?.title {
            hardness = configTitle
        } else if let currentTitle = sender.currentTitle {
            hardness = currentTitle
        } else {
            print("Error: Button title is nil")
            return
        }
        
        timer.invalidate()
        
        if let time = eggTimes[hardness] {
            totalTime = time * 60
            
            secondsPassed = 0
            progressBar.progress = 0.0
            
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(update),
                userInfo: nil,
                repeats: true
            )
        } else {
            print("Error: No egg time found for \(hardness)")
        }
        
    }
    
    @IBAction func mediumEggButton(_ sender: UIButton) {
        
        let hardness: String
        if let configTitle = sender.configuration?.title {
            hardness = configTitle
        } else if let currentTitle = sender.currentTitle {
            hardness = currentTitle
        } else {
            print("Error: Button title is nil")
            return
        }
        
        timer.invalidate()
        
        if let time = eggTimes[hardness] {
            totalTime = time * 60
            
            secondsPassed = 0
            progressBar.progress = 0.0
            
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(update),
                userInfo: nil,
                repeats: true
            )
        } else {
            print("Error: No egg time found for \(hardness)")
        }
        
    }
    
    @IBAction func softEggButton(_ sender: UIButton) {
        
        let hardness: String
        if let configTitle = sender.configuration?.title {
            hardness = configTitle
        } else if let currentTitle = sender.currentTitle {
            hardness = currentTitle
        } else {
            print("Error: Button title is nil")
            return
        }
        
        timer.invalidate()
        
        if let time = eggTimes[hardness] {
            totalTime = time
            
            secondsPassed = 0
            progressBar.progress = 0.0
            
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(update),
                userInfo: nil,
                repeats: true
            )
        } else {
            print("Error: No egg time found for \(hardness)")
        }
        
    }
    
}

