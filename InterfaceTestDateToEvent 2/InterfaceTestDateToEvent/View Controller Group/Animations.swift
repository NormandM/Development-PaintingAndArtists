//
//  Animations.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-11-28.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class Animations {
    var label: UILabel
    init (label: UILabel) {
        self.label = label
    }
    func growAndShrink() {
        UIView.animate(withDuration: 1, animations: {
            self.label.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.label.transform = CGAffineTransform.identity
            })
        }
    }
}

class ButtonTranslation {
    class func translate(fromButton: SpecialButton, toLabel: UILabel, labelDate: UILabel) {
        let fromButtonFrame = fromButton.frame
        let toLabelFrame = toLabel.frame
        let maxXFromButton = fromButtonFrame.maxX
        let maxYFromButton = fromButtonFrame.maxY
        let maxXToLabel = toLabelFrame.maxX
        let maxYToLabel = toLabelFrame.maxY
        UIView.animate(withDuration: 1, animations: {
            fromButton.transform = CGAffineTransform(translationX: maxXToLabel - maxXFromButton, y: maxYToLabel - maxYFromButton)}, completion:{finished in completionAnimation(fromButton: fromButton, toLabel: toLabel, labelDate: labelDate)})
        }
    class func completionAnimation(fromButton: SpecialButton, toLabel: UILabel, labelDate: UILabel){
        let screen = ScreenSize()
        let screenSize = screen.identify()
        let fontDate = screenSize.2
        labelDate.font = fontDate
        toLabel.isHidden = true
        labelDate.isHidden = false
        labelDate.layer.masksToBounds = true
        labelDate.numberOfLines = 0
        labelDate.lineBreakMode = .byWordWrapping
        labelDate.layer.cornerRadius = labelDate.frame.width/2
        labelDate.backgroundColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 0.5)
        fromButton.isHidden =  false
        fromButton.isEnabled = false
        fromButton.backgroundColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 0.5)

    }
}
class CircularAnimation {
    class func circle (view: UIView, label: UILabel) {
        let viewFrame = view.frame
        let maxXViewFrame = viewFrame.maxX
        let maxYViewFrame = viewFrame.maxY
        let circlePosition =  CGPoint(x: maxXViewFrame/2, y: maxYViewFrame/4)
        let circlePath = UIBezierPath(arcCenter: circlePosition, radius: 80, startAngle: 0, endAngle: .pi*2, clockwise: true)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 4
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        label.layer.add(animation, forKey: nil)
    }
}













