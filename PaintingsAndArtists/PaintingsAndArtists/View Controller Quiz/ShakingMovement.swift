//
//  ShakingMovement.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-06-24.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class Shake {
    func shakeViewVertical(vw: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [0, 10, -10, 10, -10, 10, -10, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 3.0
        animation.isAdditive = true
        
        vw.layer.add(animation, forKey: "shake")
    }
    func shakeViewHorizontal(vw: UIView){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, -10, 10, -10, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 3.0
        animation.isAdditive = true
        vw.layer.add(animation, forKey: "shake")
    }
}
