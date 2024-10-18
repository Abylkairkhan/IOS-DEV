//
//  ViewController.swift
//  xylophone
//
//  Created by Abylkairkhan Sarsetayev on 18.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audio : AVAudioPlayer!
    var soundArray = ["A", "B", "C", "D", "E", "F", "G"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    @IBAction func uiButton(_ sender: BounceButton) {
        let selectedSound = soundArray[(sender.tag)-1]
        playSound(sound: selectedSound)
    }
    
    func playSound(sound: String) {
        let soundURL = Bundle.main.url(forResource: sound, withExtension: ".wav")
        
        do {
            try audio = AVAudioPlayer(contentsOf: soundURL!)
            audio.prepareToPlay()
            audio.play()
        } catch {
            printContent(error)
        }
    }
    
}

