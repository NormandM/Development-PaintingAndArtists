//
//  CreditManagement.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-16.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
class CreditManagment{
    class func increaseOneCredit(hintButton: UIButton?){
        let credit = UserDefaults.standard.integer(forKey: "credit") + 1
        UserDefaults.standard.set(credit, forKey: "credit")
        if let button = hintButton {
            button.setTitle("\(credit) Coins available for Hints", for: .normal)
        }
    }
    class func increaseFiveCredit() {
        let credit = UserDefaults.standard.integer(forKey: "credit") + 5
        UserDefaults.standard.set(credit, forKey: "credit")
    }
    class func increaseFiftheenCredit(){
        let credit = UserDefaults.standard.integer(forKey: "credit") + 15
        UserDefaults.standard.set(credit, forKey: "credit")
    }
    class func increaseThirtyCredit(){
        let credit = UserDefaults.standard.integer(forKey: "credit") + 30
        UserDefaults.standard.set(credit, forKey: "credit")
    }
    class func increseFiftyCredit() {
        let credit = UserDefaults.standard.integer(forKey: "credit") + 30
        UserDefaults.standard.set(credit, forKey: "credit")
        
    }
    class func decreaseOneCredit(hintButton: UIButton){
        let credit = UserDefaults.standard.integer(forKey: "credit") - 1
        UserDefaults.standard.set(credit, forKey: "credit")
        hintButton.setTitle("\(credit) Coins available for Hints", for: .normal)
    }
    class func decreaseTwoCredit(hintButton: UIButton){
        let credit = UserDefaults.standard.integer(forKey: "credit") - 2
        UserDefaults.standard.set(credit, forKey: "credit")
        hintButton.setTitle("\(credit) Coins available for Hints", for: .normal)
    }
    class func decreaseThreeCredit(hintButton: UIButton){
        let credit = UserDefaults.standard.integer(forKey: "credit") - 3
        UserDefaults.standard.set(credit, forKey: "credit")
        hintButton.setTitle("\(credit) Coins available for Hints", for: .normal)
    }
    class func displayCredit(hintButton: UIButton){
        let credit = UserDefaults.standard.integer(forKey: "credit")
        hintButton.setTitle("\(credit) Coins available for Hints", for: .normal)
    }
    
}
