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
    func startQuizExtra() {
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
        buttonFirstDate.backgroundColor = UIColor.lightGray
        buttonFirstDate.isEnabled = true
        buttonSecondDate.backgroundColor = UIColor.lightGray
        buttonSecondDate.isEnabled = true
        buttonThirdDate.backgroundColor = UIColor.lightGray
        buttonThirdDate.isEnabled = true
        buttonFourthDate.backgroundColor = UIColor.lightGray
        buttonFourthDate.isEnabled = true
        buttonFifthDate.backgroundColor = UIColor.lightGray
        buttonFifthDate.isEnabled = true
        buttonSixthDate.backgroundColor = UIColor.lightGray
        buttonSixthDate.isEnabled = true
        
        
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
