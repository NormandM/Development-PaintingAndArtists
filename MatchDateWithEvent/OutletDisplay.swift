//
//  OutletDisplay.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-26.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class DisplayOutlet {
    let eliminateButton: UIButton
    let showButton: UIButton
    let tryAgainOrNext: UIButton
    
    init(eliminateButton: UIButton, showButton:UIButton, tryAgainOrNext: UIButton){
        self.eliminateButton = eliminateButton
        self.showButton = showButton
        self.tryAgainOrNext = tryAgainOrNext
    }
}
extension DisplayOutlet{
    func forTryAgain(){
        eliminateButton.isHidden = false
        eliminateButton.isEnabled = true
        showButton.isHidden = false
        showButton.isEnabled = true
        tryAgainOrNext.isHidden = true
        tryAgainOrNext.isEnabled = false
    }
    func forWrongAnswer() {
        showButton.isHidden = true
        showButton.isEnabled = false
        eliminateButton.isHidden = true
        eliminateButton.isEnabled = false
        tryAgainOrNext.isHidden = false
        tryAgainOrNext.isEnabled = true
        tryAgainOrNext.setTitle("Try Again", for: .normal)


    }
    func quizMode() {
        showButton.isHidden = false
        showButton.isEnabled = true
        eliminateButton.isHidden = false
        eliminateButton.isEnabled = true
        tryAgainOrNext.isHidden = true
        tryAgainOrNext.isEnabled = false


    }
    
}
