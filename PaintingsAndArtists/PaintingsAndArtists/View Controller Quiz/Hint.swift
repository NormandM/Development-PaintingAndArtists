//
//  Hint.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-02.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class Hint{
    class func manageHints (buttonLabel: String, finalArrayOfButtonNames: [String], painterName: String, painterButton: [UIButton], placeHolderButton: UIButton, labelTitle: UILabel, view: ViewController, nextButton: UIButton, titleText: String, showBioView: () -> Void){
        var credit = UserDefaults.standard.integer(forKey: "credit")
        var buttonIndexToBeHidden = [Int]()
        var n = 0
        switch buttonLabel {
        case HintLabel.buyCoins.rawValue:
            return
        case HintLabel.dropTwoPainters.rawValue:
            print(finalArrayOfButtonNames)
            print(painterName)

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
            credit = credit - 2
            UserDefaults.standard.set(credit, forKey: "credit")
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
            credit = credit - 3
            UserDefaults.standard.set(credit, forKey: "credit")
        case HintLabel.showBio.rawValue:
            showBioView()
            credit = credit - 1
            UserDefaults.standard.set(credit, forKey: "credit")
            
        default:
            return
        }
        
        
    }
}


