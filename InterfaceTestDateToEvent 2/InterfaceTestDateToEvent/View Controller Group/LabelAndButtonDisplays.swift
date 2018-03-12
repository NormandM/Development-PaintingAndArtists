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
    var labelFirstDate: UILabel
    var labelSecondDate: UILabel
    var labelThirdDate: UILabel
    var buttonFirstDate: SpecialButton
    var buttonSecondDate: SpecialButton
    var buttonThirdDate: SpecialButton
    var buttonFourthDate: SpecialButton
    var buttonFifthDate: SpecialButton
    var buttonSixthDate: SpecialButton
    let fontSizeAndScreenSize = ScreenSize()
    init (labelFirstEvent: UILabel, labelSecondEvent: UILabel, labelThirdEvent: UILabel, labelFirstDate: SpecialLabel, labelSecondDate: SpecialLabel, labelThirdDate: SpecialLabel, buttonFirstDate: SpecialButton, buttonSecondDate: SpecialButton, buttonThirdDate: SpecialButton, buttonFourthDate: SpecialButton, buttonFifthDate: SpecialButton, buttonSixthDate: SpecialButton){
        self.labelFirstEvent = labelFirstEvent
        self.labelSecondEvent = labelSecondEvent
        self.labelThirdEvent = labelThirdEvent
        self.labelFirstDate = labelFirstDate
        self.labelSecondDate = labelSecondDate
        self.labelThirdDate = labelThirdDate
        self.buttonFirstDate = buttonFirstDate
        self.buttonSecondDate = buttonSecondDate
        self.buttonThirdDate = buttonThirdDate
        self.buttonFourthDate = buttonFourthDate
        self.buttonFifthDate = buttonFifthDate
        self.buttonSixthDate = buttonSixthDate
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
        }else if fontSizeAndScreenSize.identify().0 == "extraExtraExtraLarge"{
            fontSize = fontSizeAndScreenSize.identify().1
            fontSize2 = fontSizeAndScreenSize.identify().2
        }
        return (fontSize, fontSize2)
    }
    func buttonFormat(event: [String], indexEvent: [Int]) {
        buttonFirstDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFirstDate.layer.cornerRadius = 20
        buttonFirstDate.backgroundColor = UIColor(displayP3Red: 199/255, green: 173/255, blue: 136/255, alpha: 1.0)
        buttonFirstDate.setTitle(event[indexEvent[0]], for: .normal)
        buttonFirstDate.titleLabel?.numberOfLines = 0
        buttonFirstDate.titleLabel?.font = fontAndScreenSize().0
        buttonFirstDate.titleLabel?.lineBreakMode = .byWordWrapping
        
        buttonSecondDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonSecondDate.layer.cornerRadius = 20
        buttonSecondDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonSecondDate.setTitle(event[indexEvent[1]], for: .normal)
        buttonSecondDate.titleLabel?.font = fontAndScreenSize().0
        buttonSecondDate.titleLabel?.numberOfLines = 0
        buttonSecondDate.titleLabel?.lineBreakMode = .byWordWrapping
       
        buttonThirdDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonThirdDate.layer.cornerRadius = 20
        buttonThirdDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonThirdDate.setTitle(event[indexEvent[2]], for: .normal)
        buttonThirdDate.titleLabel?.font = fontAndScreenSize().0
        buttonThirdDate.titleLabel?.numberOfLines = 0
        buttonThirdDate.titleLabel?.lineBreakMode = .byWordWrapping
        
        
        buttonFourthDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFourthDate.layer.cornerRadius = 20
        buttonFourthDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonFourthDate.setTitle(event[indexEvent[3]], for: .normal)
        buttonFourthDate.titleLabel?.font = fontAndScreenSize().0
        buttonFourthDate.titleLabel?.numberOfLines = 0
        buttonFourthDate.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
       
        buttonFifthDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonFifthDate.layer.cornerRadius = 20
        buttonFifthDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonFifthDate.setTitle(event[indexEvent[4]], for: .normal)
        buttonFifthDate.titleLabel?.font = fontAndScreenSize().0
        buttonFifthDate.titleLabel?.numberOfLines = 0
        buttonFifthDate.titleLabel?.lineBreakMode = .byWordWrapping
        
        
        buttonSixthDate.titleLabel?.textAlignment = NSTextAlignment.center
        buttonSixthDate.layer.cornerRadius = 20
        buttonSixthDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonSixthDate.setTitle(event[indexEvent[5]], for: .normal)
        buttonSixthDate.titleLabel?.font = fontAndScreenSize().0
        buttonSixthDate.titleLabel?.numberOfLines = 0
        buttonSixthDate.titleLabel?.lineBreakMode = .byWordWrapping
        
    }
    func buttonAllDisabled() {
        buttonFirstDate.isEnabled = false
        buttonSecondDate.isEnabled = false
        buttonThirdDate.isEnabled = false
        buttonFourthDate.isEnabled = false
        buttonFifthDate.isEnabled = false
        buttonSixthDate.isEnabled = false
    }
    func buttonsAllEnabled() {
        buttonFirstDate.isEnabled = true
        buttonSecondDate.isEnabled = true
        buttonThirdDate.isEnabled = true
        buttonFourthDate.isEnabled = true
        buttonFifthDate.isEnabled = true
        buttonSixthDate.isEnabled = true
        
    }
    func labelFormat(){
        labelFirstEvent.font = fontAndScreenSize().0
        labelSecondEvent.font = fontAndScreenSize().0
        labelThirdEvent.font = fontAndScreenSize().0
        labelFirstDate.font = fontAndScreenSize().1
        labelSecondDate.font = fontAndScreenSize().1
        labelThirdDate.font = fontAndScreenSize().1
    }
    func allShown() {
        labelFirstEvent.isHidden = false
        labelSecondEvent.isHidden = false
        labelThirdEvent.isHidden = false
        labelFirstDate.isHidden = false
        labelSecondDate.isHidden = false
        labelThirdDate.isHidden = false
        buttonFirstDate.isHidden = false
        buttonSecondDate.isHidden = false
        buttonThirdDate.isHidden = false
        buttonFourthDate.isHidden = false
        buttonFifthDate.isHidden = false
        buttonSixthDate.isHidden = false
    }
    func allHidden() {
        labelFirstEvent.isHidden = true
        labelSecondEvent.isHidden = true
        labelThirdEvent.isHidden = true
        labelFirstDate.isHidden = true
        labelSecondDate.isHidden = true
        labelThirdDate.isHidden = true
        buttonFirstDate.isHidden = true
        buttonSecondDate.isHidden = true
        buttonThirdDate.isHidden = true
        buttonFourthDate.isHidden = true
        buttonFifthDate.isHidden = true
        buttonSixthDate.isHidden = true
    }
    
    func startQuiz() {
        labelFirstEvent.isHidden = true
        labelSecondEvent.isHidden = true
        labelThirdEvent.isHidden = true
        labelFirstDate.isHidden = true
        labelSecondDate.isHidden = true
        labelThirdDate.isHidden = true
        buttonFirstDate.isEnabled = true
        buttonFirstDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonFirstDate.tintColor = UIColor.white
        buttonSecondDate.isEnabled = true
        buttonSecondDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonThirdDate.isEnabled = true
        buttonThirdDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonFourthDate.isEnabled = true
        buttonFourthDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonFifthDate.isEnabled = true
        buttonFifthDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonSixthDate.isEnabled = true
        buttonSixthDate.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
//        buttonCredits.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        buttonFirstDate.buttonWasMoved = false
        buttonSecondDate.buttonWasMoved = false
        buttonThirdDate.buttonWasMoved = false
        buttonFourthDate.buttonWasMoved = false
        buttonFifthDate.buttonWasMoved = false
        buttonSixthDate.buttonWasMoved = false
        buttonFirstDate.buttonRightResponse = "0"
        buttonSecondDate.buttonRightResponse = "0"
        buttonThirdDate.buttonRightResponse = "0"
        buttonFourthDate.buttonRightResponse = "0"
        buttonFifthDate.buttonRightResponse = "0"
        buttonSixthDate.buttonRightResponse = "0"
    }
    func prepareForAnimation() {
        labelFirstEvent.isHidden = true
        labelSecondEvent.isHidden = true
        labelThirdEvent.isHidden = true
        buttonFirstDate.transform = CGAffineTransform.identity
        buttonSecondDate.transform = CGAffineTransform.identity
        buttonThirdDate.transform = CGAffineTransform.identity
        buttonFourthDate.transform = CGAffineTransform.identity
        buttonFifthDate.transform = CGAffineTransform.identity
        buttonSixthDate.transform = CGAffineTransform.identity
        buttonFirstDate.isHidden = false
        buttonSecondDate.isHidden = false
        buttonThirdDate.isHidden = false
        buttonFourthDate.isHidden = false
        buttonFifthDate.isHidden = false
        buttonSixthDate.isHidden = false
        buttonFirstDate.isEnabled = true
        buttonSecondDate.isEnabled = true
        buttonThirdDate.isEnabled = true
        buttonFourthDate.isEnabled = true
        buttonFifthDate.isEnabled = true
        buttonSixthDate.isEnabled = true
    }

}
class SpecialButton: UIButton {
    var buttonWasMoved: Bool = false
    var buttonRightResponse: String = "0"

}
class SpecialLabel: UILabel {
    var topInset:       CGFloat = 0
    var rightInset:     CGFloat = 5
    var bottomInset:    CGFloat = 0
    var leftInset:      CGFloat = 5
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: self.topInset, left: self.leftInset, bottom: self.bottomInset, right: self.rightInset)
        self.setNeedsLayout()
        return super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
}

class BarButtons {
    class func creditButton(creditButton: UIButton) -> UIButton{
        creditButton.backgroundColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 0.5)
        let imageName = "coin.png"
        let coinImage = UIImage(named: imageName)
        let coinImageView = UIImageView(image: coinImage!)
        coinImageView.frame = CGRect(origin: CGPoint(x: 25, y: 7), size: CGSize(width: 30, height: 30))
        creditButton.addSubview(coinImageView)
        return creditButton
    }
    class func knowledgeButton(knowledgeButton: UIButton){
                knowledgeButton.backgroundColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 0.5)
        let imageName = "book.png"
        let knowledgeButtonImage = UIImage(named: imageName)
        let knowledgeButtonImageView = UIImageView(image: knowledgeButtonImage!)
        knowledgeButtonImageView.frame = CGRect(origin: CGPoint(x: 5, y: 7), size: CGSize(width: 30, height: 30))
        knowledgeButton.addSubview(knowledgeButtonImageView)
    }
}

class CountDownLabel {
    class func countDownLabel(myTypeWriter: UITextView) -> UILabel{
        var countDownLabel = UILabel(frame: CGRect(origin: CGPoint(x: myTypeWriter.frame.width/2 - 50, y: myTypeWriter.frame.height - 100 ), size: CGSize(width: 100, height: 100)))
        let screen = ScreenSize()
        let screenSize = screen.identify().0
        if screenSize == "extraLarge" || screenSize == "extraExtraLarge" || screenSize == "extraExtraExtraLarge"{
            countDownLabel = UILabel(frame: CGRect(origin: CGPoint(x: myTypeWriter.frame.width/2 - 75, y: myTypeWriter.frame.height - 170 ), size: CGSize(width: 150, height: 100)))
            countDownLabel.font = UIFont.systemFont(ofSize: 120)
        }else{
            countDownLabel.font = UIFont.systemFont(ofSize: 60)
        }
        countDownLabel.textAlignment = .center
        countDownLabel.backgroundColor = UIColor.clear
        countDownLabel.textColor = UIColor.white
        myTypeWriter.addSubview(countDownLabel)
        return countDownLabel
    }
}
class QuizProgressionBar {
    class func quizProgressionBar(myTypeWriter: UITextView, numberCompleted: Int, totalNumber: Int){
        let quizProgressionBar = UIProgressView()
        let screen = ScreenSize()
        let screenSize = screen.identify().0
        if screenSize == "extraLarge" || screenSize == "extraExtraLarge" || screenSize == "extraExtraExtraLarge"{
            quizProgressionBar.frame = CGRect(origin: CGPoint(x: myTypeWriter.frame.width/2 - 200, y: myTypeWriter.frame.height/1.7 ), size: CGSize(width: 400, height: 0))
        }else{
            quizProgressionBar.frame = CGRect(origin: CGPoint(x: myTypeWriter.frame.width/2 - 100, y: myTypeWriter.frame.height/1.8 ), size: CGSize(width: 200, height: 0))
        }
        let percentcompleted = Double(numberCompleted)/Double(totalNumber)
        quizProgressionBar.isUserInteractionEnabled = false
        quizProgressionBar.progressViewStyle = .bar
        quizProgressionBar.progress = Float(percentcompleted)
        quizProgressionBar.progressTintColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        quizProgressionBar.trackTintColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 1.0)
        quizProgressionBar.transform = quizProgressionBar.transform.scaledBy(x: 1, y: 3)
        quizProgressionBar.clipsToBounds = true
        quizProgressionBar.layer.cornerRadius = 15.0
        myTypeWriter.addSubview(quizProgressionBar)
    }
        
}
class ContinueQuizButton {
    @objc class func continueQuiz(myTypeWriter: UITextView, view: UIView) -> UIButton {
        let screen = ScreenSize()
        let screenSize = screen.identify().0
        let continueQuizButton = UIButton()
        let typeWriterFrameX = myTypeWriter.frame.midX
        let typeWriterFrameY = myTypeWriter.frame.minY
        if screenSize == "extraLarge" || screenSize == "extraExtraLarge" || screenSize == "extraExtraExtraLarge"{
            continueQuizButton.frame = CGRect(origin: CGPoint(x: typeWriterFrameX - 100, y: typeWriterFrameY + myTypeWriter.frame.height/1.4 ), size: CGSize(width: 200, height: 50))
            continueQuizButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        }else{
            continueQuizButton.frame = CGRect(origin: CGPoint(x: typeWriterFrameX - 50, y: typeWriterFrameY + myTypeWriter.frame.height/1.5 ), size: CGSize(width: 100, height: 40))
                continueQuizButton.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        }
        continueQuizButton.titleLabel?.textAlignment = NSTextAlignment.center
        continueQuizButton.layer.cornerRadius = 15
        continueQuizButton.setTitle("Continue Quiz", for: .normal)
        continueQuizButton.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        continueQuizButton.titleLabel?.textColor = UIColor.white
        continueQuizButton.showsTouchWhenHighlighted = true
        continueQuizButton.isEnabled = true
        view.addSubview(continueQuizButton)
        return continueQuizButton
    }

    
}


