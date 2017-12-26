//
//  LabelAndButtonDisplays.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-11-28.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class LabelAndButtonDisplay {
    var labelFirstEvent: UILabel
    var labelSecondEvent: UILabel
    var labelThirdEvent: UILabel
    var labelFourthEvent: UILabel
    var labelFifthEvent: UILabel
    var labelFirstDate: UILabel
    var labelSecondDate: UILabel
    var labelThirdDate: UILabel
    var labelFourthDate: UILabel
    var labelFifthDate: UILabel
    var buttonFirstDate: UIButton
    var buttonSecondDate: UIButton
    var buttonThirdDate: UIButton
    var buttonFourthDate: UIButton
    var buttonFifthDate: UIButton
    var buttonSixthDate: UIButton
    var buttonCredits: UIButton
    let fontSizeAndScreenSize = ScreenSize()
    //var fontSize =  UIFont()
    init (labelFirstEvent: UILabel, labelSecondEvent: UILabel, labelThirdEvent: UILabel, labelFourthEvent: UILabel, labelFifthEvent: UILabel, labelFirstDate: UILabel, labelSecondDate: UILabel, labelThirdDate: UILabel, labelFourthDate: UILabel, labelFifthDate: UILabel, buttonFirstDate: UIButton, buttonSecondDate: UIButton, buttonThirdDate: UIButton, buttonFourthDate: UIButton, buttonFifthDate: UIButton, buttonSixthDate: UIButton, buttonCredits: UIButton){
        self.labelFirstEvent = labelFirstEvent
        self.labelSecondEvent = labelSecondEvent
        self.labelThirdEvent = labelThirdEvent
        self.labelFourthEvent = labelFourthEvent
        self.labelFifthEvent = labelFifthEvent
        self.labelFirstDate = labelFirstDate
        self.labelSecondDate = labelSecondDate
        self.labelThirdDate = labelThirdDate
        self.labelFourthDate = labelFourthDate
        self.labelFifthDate = labelFifthDate
        self.buttonFirstDate = buttonFirstDate
        self.buttonSecondDate = buttonSecondDate
        self.buttonThirdDate = buttonThirdDate
        self.buttonFourthDate = buttonFourthDate
        self.buttonFifthDate = buttonFifthDate
        self.buttonSixthDate = buttonSixthDate
        self.buttonCredits = buttonCredits
    }
    func fontAndScreenSize () -> (UIFont, UIFont){
        var fontSize = UIFont()
        var fontSize2 = UIFont()
        if fontSizeAndScreenSize.identify().0 == "small"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "average"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "large"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "extraLarge"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "extraExtraLarge"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }
        return (fontSize, fontSize2)
    }
    func buttonFormat(event: [String], indexEvent: [Int]) {
        buttonFirstDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFirstDate.layer.cornerRadius = 20
        buttonFirstDate.backgroundColor = UIColor.lightGray
        buttonFirstDate.setTitle(event[indexEvent[0]], for: .normal)
        buttonFirstDate.titleLabel?.font = fontAndScreenSize().0
        buttonSecondDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonSecondDate.layer.cornerRadius = 20
        buttonSecondDate.backgroundColor = UIColor.lightGray
        buttonSecondDate.setTitle(event[indexEvent[1]], for: .normal)
        buttonSecondDate.titleLabel?.font = fontAndScreenSize().0
        buttonThirdDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonThirdDate.layer.cornerRadius = 20
        buttonThirdDate.backgroundColor = UIColor.lightGray
        buttonThirdDate.setTitle(event[indexEvent[2]], for: .normal)
        buttonThirdDate.titleLabel?.font = fontAndScreenSize().0
        buttonFourthDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFourthDate.layer.cornerRadius = 20
        buttonFourthDate.backgroundColor = UIColor.lightGray
        buttonFourthDate.setTitle(event[indexEvent[3]], for: .normal)
        buttonFourthDate.titleLabel?.font = fontAndScreenSize().0
        buttonFifthDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFifthDate.layer.cornerRadius = 20
        buttonFifthDate.backgroundColor = UIColor.lightGray
        buttonFifthDate.setTitle(event[indexEvent[4]], for: .normal)
        buttonFifthDate.titleLabel?.font = fontAndScreenSize().0
        buttonSixthDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonSixthDate.layer.cornerRadius = 20
        buttonSixthDate.backgroundColor = UIColor.lightGray
        buttonSixthDate.setTitle(event[indexEvent[5]], for: .normal)
        buttonSixthDate.titleLabel?.font = fontAndScreenSize().0
    }
    func labelFormat(){
        labelFirstEvent.font = fontAndScreenSize().0
        labelSecondEvent.font = fontAndScreenSize().0
        labelThirdEvent.font = fontAndScreenSize().0
        labelFourthEvent.font = fontAndScreenSize().0
        labelFifthEvent.font = fontAndScreenSize().0
        labelFirstDate.font = fontAndScreenSize().1
        labelSecondDate.font = fontAndScreenSize().1
        labelThirdDate.font = fontAndScreenSize().1
        labelFourthDate.font = fontAndScreenSize().1
        labelFifthDate.font = fontAndScreenSize().1
    }
    func allHidden() {
        labelFirstEvent.isHidden = true
        labelSecondEvent.isHidden = true
        labelThirdEvent.isHidden = true
        labelFourthEvent.isHidden = true
        labelFifthEvent.isHidden = true
        labelFirstDate.isHidden = true
        labelSecondDate.isHidden = true
        labelThirdDate.isHidden = true
        labelFourthDate.isHidden = true
        labelFifthDate.isHidden = true
        buttonFirstDate.isHidden = true
        buttonSecondDate.isHidden = true
        buttonThirdDate.isHidden = true
        buttonFourthDate.isHidden = true
        buttonFifthDate.isHidden = true
        buttonSixthDate.isHidden = true
    }
    func allShown() {
        labelFirstEvent.isHidden = false
        labelSecondEvent.isHidden = false
        labelThirdEvent.isHidden = false
        labelFourthEvent.isHidden = false
        labelFifthEvent.isHidden = false
        labelFirstDate.isHidden = false
        labelSecondDate.isHidden = false
        labelThirdDate.isHidden = false
        labelFourthDate.isHidden = false
        labelFifthDate.isHidden = false
        buttonFirstDate.isHidden = false
        buttonSecondDate.isHidden = false
        buttonThirdDate.isHidden = false
        buttonFourthDate.isHidden = false
        buttonFifthDate.isHidden = false
        buttonSixthDate.isHidden = false
    }
    func startQuiz() {
        labelFirstEvent.isHidden = false
        labelFirstEvent.text = "?"
        labelSecondEvent.isHidden = true
        labelThirdEvent.isHidden = true
        labelFourthEvent.isHidden = true
        labelFifthEvent.isHidden = true
        buttonFirstDate.isEnabled = true
        buttonFirstDate.backgroundColor = UIColor.lightGray
        buttonSecondDate.isEnabled = true
        buttonSecondDate.backgroundColor = UIColor.lightGray
        buttonThirdDate.isEnabled = true
        buttonThirdDate.backgroundColor = UIColor.lightGray
        buttonFourthDate.isEnabled = true
        buttonFourthDate.backgroundColor = UIColor.lightGray
        buttonFifthDate.isEnabled = true
        buttonFifthDate.backgroundColor = UIColor.lightGray
        buttonSixthDate.isEnabled = true
        buttonSixthDate.backgroundColor = UIColor.lightGray
    }

    func stopQuiz() {
        buttonFirstDate.isEnabled = false
        buttonSecondDate.isEnabled = false
        buttonThirdDate.isEnabled = false
        buttonFourthDate.isEnabled = false
        buttonFifthDate.isEnabled = false
        buttonSixthDate.isEnabled = false
        
    }

}

class LabelAndButtonDisplayExtra {
    var firstEventExtra: UILabel!
    var labelSecondEventExtra: UILabel!
    var labelThirdEventExtra: UILabel!
    var labelFourthEventExtra: UILabel!
    var labelFifthEventExtra: UILabel!
    var labelFirstDateExtra: UILabel!
    var labelSecondDateExtra: UILabel!
    var labelThirdDateExtra: UILabel!
    var labelFourthDateExtra: UILabel!
    var labelFifthDateExtra: UILabel!
    var timerLabelExtra: UILabel!
    var buttonFirstDateExtra: UIButton!
    var buttonSecondDateExtra: UIButton!
    var buttonThirdDateExtra: UIButton!
    var buttonFourthDateExtra: UIButton!
    var buttonFifthDateExtra: UIButton!
    var buttonSixthDateExtra: UIButton!
    var buttonCreditExtra: UIButton!
    let fontSizeAndScreenSize = ScreenSize()
    
    init (firstEventExtra: UILabel, labelSecondEventExtra: UILabel, labelThirdEventExtra: UILabel, labelFourthEventExtra: UILabel, labelFifthEventExtra: UILabel, labelFirstDateExtra: UILabel, labelSecondDateExtra: UILabel, labelThirdDateExtra: UILabel, labelFourthDateExtra: UILabel, labelFifthDateExtra: UILabel, buttonFirstDateExtra: UIButton, buttonSecondDateExtra: UIButton, buttonThirdDateExtra: UIButton, buttonFourthDateExtra: UIButton, buttonFifthDateExtra: UIButton, buttonSixthDateExtra: UIButton, buttonCreditExtra: UIButton){
        self.firstEventExtra = firstEventExtra
        self.labelSecondEventExtra = labelSecondEventExtra
        self.labelThirdEventExtra = labelThirdEventExtra
        self.labelFourthEventExtra = labelFourthEventExtra
        self.labelFifthEventExtra = labelFifthEventExtra
        self.labelFirstDateExtra = labelFirstDateExtra
        self.labelSecondDateExtra = labelSecondDateExtra
        self.labelThirdDateExtra = labelThirdDateExtra
        self.labelFourthDateExtra = labelFourthDateExtra
        self.labelFifthDateExtra = labelFifthDateExtra
        self.buttonFirstDateExtra = buttonFirstDateExtra
        self.buttonSecondDateExtra = buttonSecondDateExtra
        self.buttonThirdDateExtra = buttonThirdDateExtra
        self.buttonFourthDateExtra = buttonFourthDateExtra
        self.buttonFifthDateExtra = buttonFifthDateExtra
        self.buttonSixthDateExtra = buttonSixthDateExtra
        self.buttonCreditExtra = buttonCreditExtra
    }
    func fontAndScreenSize () -> (UIFont, UIFont){
        var fontSize = UIFont()
        var fontSize2 = UIFont()
        if fontSizeAndScreenSize.identify().0 == "small"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "average"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "large"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "extraLarge"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }else if fontSizeAndScreenSize.identify().0 == "extraExtraLarge"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }
        return (fontSize, fontSize2)
    }
    func labelFormat(){
        firstEventExtra.font = fontAndScreenSize().0
        labelSecondEventExtra.font = fontAndScreenSize().0
        labelThirdEventExtra.font = fontAndScreenSize().0
        labelFourthEventExtra.font = fontAndScreenSize().0
        labelFifthEventExtra.font = fontAndScreenSize().0
        labelFirstDateExtra.font = fontAndScreenSize().1
        labelSecondDateExtra.font = fontAndScreenSize().1
        labelThirdDateExtra.font = fontAndScreenSize().1
        labelFourthDateExtra.font = fontAndScreenSize().1
        labelFifthDateExtra.font = fontAndScreenSize().1
    }
    
    func startQuizExtra() {
        firstEventExtra.isHidden = true
        labelSecondEventExtra.isHidden = true
        labelThirdEventExtra.isHidden = true
        labelFourthEventExtra.isHidden = true
        labelFifthEventExtra.isHidden = true
        labelFirstDateExtra.isHidden = true
        labelSecondDateExtra.isHidden = true
        labelThirdDateExtra.isHidden = true
        labelFourthDateExtra.isHidden = true
        labelFifthDateExtra.isHidden = true
        buttonFirstDateExtra.backgroundColor = UIColor.lightGray
        buttonFirstDateExtra.isEnabled = true
        buttonSecondDateExtra.backgroundColor = UIColor.lightGray
        buttonSecondDateExtra.isEnabled = true
        buttonThirdDateExtra.backgroundColor = UIColor.lightGray
        buttonThirdDateExtra.isEnabled = true
        buttonFourthDateExtra.backgroundColor = UIColor.lightGray
        buttonFourthDateExtra.isEnabled = true
        buttonFifthDateExtra.backgroundColor = UIColor.lightGray
        buttonFifthDateExtra.isEnabled = true
        buttonSixthDateExtra.backgroundColor = UIColor.lightGray
        buttonSixthDateExtra.isEnabled = true
        buttonCreditExtra.isHidden = false
        
    }
    func allShown() {
        firstEventExtra.isHidden = false
        labelSecondEventExtra.isHidden = false
        labelThirdEventExtra.isHidden = false
        labelFourthEventExtra.isHidden = false
        labelFifthEventExtra.isHidden = false
        labelFirstDateExtra.isHidden = false
        labelSecondDateExtra.isHidden = false
        labelThirdDateExtra.isHidden = false
        labelFourthDateExtra.isHidden = false
        labelFifthDateExtra.isHidden = false
        buttonFirstDateExtra.isHidden = false
        buttonSecondDateExtra.isHidden = false
        buttonThirdDateExtra.isHidden = false
        buttonFourthDateExtra.isHidden = false
        buttonFifthDateExtra.isHidden = false
        buttonSixthDateExtra.isHidden = false
    }
    func buttonFormat(event: [String], indexEvent: [Int]) {
        buttonFirstDateExtra.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFirstDateExtra.layer.cornerRadius = 20
        buttonFirstDateExtra.backgroundColor = UIColor.lightGray
        buttonFirstDateExtra.setTitle(event[indexEvent[0]], for: .normal)
        buttonFirstDateExtra.titleLabel?.font = fontAndScreenSize().0
        buttonSecondDateExtra.titleLabel?.textAlignment = NSTextAlignment.center
        buttonSecondDateExtra.layer.cornerRadius = 20
        buttonSecondDateExtra.backgroundColor = UIColor.lightGray
        buttonSecondDateExtra.setTitle(event[indexEvent[1]], for: .normal)
        buttonSecondDateExtra.titleLabel?.font = fontAndScreenSize().0
        buttonThirdDateExtra.titleLabel?.textAlignment = NSTextAlignment.center
        buttonThirdDateExtra.layer.cornerRadius = 20
        buttonThirdDateExtra.backgroundColor = UIColor.lightGray
        buttonThirdDateExtra.setTitle(event[indexEvent[2]], for: .normal)
        buttonThirdDateExtra.titleLabel?.font = fontAndScreenSize().0
        buttonFourthDateExtra.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFourthDateExtra.layer.cornerRadius = 20
        buttonFourthDateExtra.backgroundColor = UIColor.lightGray
        buttonFourthDateExtra.setTitle(event[indexEvent[3]], for: .normal)
        buttonFourthDateExtra.titleLabel?.font = fontAndScreenSize().0
        buttonFifthDateExtra.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFifthDateExtra.layer.cornerRadius = 20
        buttonFifthDateExtra.backgroundColor = UIColor.lightGray
        buttonFifthDateExtra.setTitle(event[indexEvent[4]], for: .normal)
        buttonFifthDateExtra.titleLabel?.font = fontAndScreenSize().0
        buttonSixthDateExtra.titleLabel?.textAlignment = NSTextAlignment.center
        buttonSixthDateExtra.layer.cornerRadius = 20
        buttonSixthDateExtra.backgroundColor = UIColor.lightGray
        buttonSixthDateExtra.setTitle(event[indexEvent[5]], for: .normal)
        buttonSixthDateExtra.titleLabel?.font = fontAndScreenSize().0
    }
    func stopQuiz() {
        buttonFirstDateExtra.isEnabled = false
        buttonSecondDateExtra.isEnabled = false
        buttonThirdDateExtra.isEnabled = false
        buttonFourthDateExtra.isEnabled = false
        buttonFifthDateExtra.isEnabled = false
        buttonSixthDateExtra.isEnabled = false
        
    }
    
}


