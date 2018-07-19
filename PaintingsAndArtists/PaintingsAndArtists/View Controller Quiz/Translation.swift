//
//  Translation.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-06-25.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
class ButtonTranslation {
    class func translate(fromButton: UIButton, toButton: UIButton) {
        let fromButtonFrame = fromButton.frame
        let toButtonFrame = toButton.frame
        let maxXFromButton = fromButtonFrame.maxX
        let maxYFromButton = fromButtonFrame.maxY
        let maxXToButton = toButtonFrame.maxX
        let maxYToButton = toButtonFrame.maxY
        UIView.animate(withDuration: 1, animations: {
            fromButton.transform = CGAffineTransform(translationX: maxXToButton - maxXFromButton, y: maxYToButton - maxYFromButton)}, completion:{finished in completionAnimation(fromButton: fromButton, toButton: toButton)})
    }
    class func completionAnimation(fromButton: UIButton, toButton: UIButton){
        fromButton.isHidden =  false
        fromButton.isEnabled = false
        fromButton.backgroundColor = UIColor.black
        fromButton.titleLabel?.textColor = UIColor.white
        
    }
}
