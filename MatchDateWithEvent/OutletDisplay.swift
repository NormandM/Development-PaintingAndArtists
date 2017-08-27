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
    let tryAgainButton: UIButton
    let showButton: UIButton
    init(eliminateButton: UIButton, tryAgainButton: UIButton, showButton:UIButton){
        self.eliminateButton = eliminateButton
        self.tryAgainButton = tryAgainButton
        self.showButton = showButton
    }
}
extension DisplayOutlet{
    func forTryAgain(){
        eliminateButton.isHidden = false
        eliminateButton.isEnabled = true
        tryAgainButton.isHidden = true
        tryAgainButton.isEnabled = false
        showButton.isHidden = false
        showButton.isEnabled = true
    }
    func forWrongAnswer() {
        showButton.isHidden = true
        showButton.isEnabled = false
        eliminateButton.isHidden = true
        eliminateButton.isEnabled = false
        tryAgainButton.isEnabled = true
        tryAgainButton.isHidden = false
    }
    func quizMode() {
        showButton.isHidden = false
        showButton.isEnabled = true
        eliminateButton.isHidden = false
        eliminateButton.isEnabled = true
        tryAgainButton.isEnabled = false
        tryAgainButton.isHidden = true
        
        
    }
    
}
