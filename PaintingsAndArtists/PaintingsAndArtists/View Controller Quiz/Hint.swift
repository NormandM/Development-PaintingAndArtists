//
//  Hint.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-02.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class Hint{
    class func manageHints (buttonLabel: String, finalArrayOfButtonNames: [String], painterName: String, painterButton: [UIButton], placeHolderButton: UIButton, labelTitle: UILabel, view: ViewController, nextButton: UIButton, titleText: String, hintButton: UIButton, showBioView: () -> Void){
        var buttonIndexToBeHidden = [Int]()
        var n = 0
        switch buttonLabel {
        case HintLabel.buyCoins.rawValue:
            return
        case HintLabel.dropTwoPainters.rawValue:
            for buttonName in finalArrayOfButtonNames {
                if buttonName != painterName {
                    buttonIndexToBeHidden.append(n)
                }
                n = n + 1
            }
            painterButton[buttonIndexToBeHidden[0]].isEnabled = false
            painterButton[buttonIndexToBeHidden[0]].isHidden = true
            painterButton[buttonIndexToBeHidden[1]].isEnabled = false
            painterButton[buttonIndexToBeHidden[1]].isHidden = true
            CreditManagment.decreaseTwoCredit(hintButton: hintButton)
        case HintLabel.giveAnswer.rawValue:
            var painterIndex = Int()
            
            for buttonName in finalArrayOfButtonNames {
                if buttonName == painterName {
                    painterIndex = n
                }else{
                    painterButton[n].isHidden = true
                    painterButton[n].isEnabled = false
                }
                
                n = n + 1
            }
            ButtonTranslation.translate(fromButton: painterButton[painterIndex], toButton: placeHolderButton)
            TitleDisplay.show(labelTitle: labelTitle, titleText: titleText, nextButton: nextButton, view: view)
            CreditManagment.decreaseThreeCredit(hintButton: hintButton)
        case HintLabel.showBio.rawValue:
            showBioView()
            CreditManagment.decreaseOneCredit(hintButton: hintButton)
        default:
            return
        }
        
    }
}


