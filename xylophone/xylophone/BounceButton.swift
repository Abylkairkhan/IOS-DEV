//
//  BounceButton.swift
//  xylophone
//
//  Created by Abylkairkhan Sarsetayev on 18.10.2024.
//

import UIKit

class BounceButton: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 6,
            animations: {
                self.transform = CGAffineTransform.identity
            },
            completion: nil
        )
    }
}
