//
//  ButtonAndLabelDisplay.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-06-28.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class LabelAndButton {
    class func buttonVisible(painterButton: [UIButton], finalArrayOfButtonNames: [String]) {
        for button in painterButton {
            button.backgroundColor = UIColor(displayP3Red: 218/255, green: 69/255, blue: 49/255, alpha: 1.0)
            button.isEnabled = true
            button.isHidden = false
            button.transform = CGAffineTransform.identity
        }
        painterButton[0].titleLabel?.textAlignment = NSTextAlignment.center
        painterButton[1].titleLabel?.textAlignment = NSTextAlignment.center
        painterButton[2].titleLabel?.textAlignment = NSTextAlignment.center
        painterButton[3].titleLabel?.textAlignment = NSTextAlignment.center
        painterButton[0].setTitle(finalArrayOfButtonNames[0], for: .normal)
        painterButton[1].setTitle(finalArrayOfButtonNames[1], for: .normal)
        painterButton[2].setTitle(finalArrayOfButtonNames[2], for: .normal)
        painterButton[3].setTitle(finalArrayOfButtonNames[3], for: .normal)
    }
    class func buttonInvisible(painterButton: [UIButton], errorMessage: UILabel ) {
        for buttons in painterButton{
            buttons.isHidden = true
            buttons.isEnabled = false
        }
    }
    class func disableHintButtons(hintItemButton: [UIButton]) {
        hintItemButton.forEach {(eachButton) in
            if eachButton.titleLabel?.text != HintLabel.buyCoins.rawValue{
                eachButton.isEnabled = false
                eachButton.setTitleColor(UIColor.lightGray, for:UIControlState.normal)
            }
        }
    }
    class func enableHintButtons(hintItemButton: [UIButton]) {
        hintItemButton.forEach {(eachButton) in
            eachButton.isEnabled = true
            eachButton.setTitleColor(UIColor(displayP3Red: 27/255, green: 95/255, blue: 94/255, alpha: 1), for:UIControlState.normal)
        }
    }
}
