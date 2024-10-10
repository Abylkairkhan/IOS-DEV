//
//  ViewController.swift
//  Dicee
//
//  Created by Abylkairkhan Sarsetayev on 10.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let diceArray = [
        UIImage(named: "dice-one"),
        UIImage(named: "dice-two"),
        UIImage(named: "dice-three"),
        UIImage(named: "dice-four"),
        UIImage(named: "dice-five"),
        UIImage(named: "dice-six"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        if let diceImage1 = diceArray.randomElement() as? UIImage {
                    diceImageView1.image = diceImage1
                }
                if let diceImage2 = diceArray.randomElement() as? UIImage {
                    diceImageView2.image = diceImage2
                }
    }
}

