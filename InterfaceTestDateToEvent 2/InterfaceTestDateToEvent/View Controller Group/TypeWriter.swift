//
//  TypeWriter.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-15.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
import AVFoundation

class TypeWriter {
    
    class func typeWriter(myTypeWriter : UITextView){
        myTypeWriter.backgroundColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 0.5)
        myTypeWriter.textAlignment = .center
        myTypeWriter.layer.masksToBounds = true
        myTypeWriter.layer.borderWidth = 5
        myTypeWriter.layer.borderColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 1.0).cgColor
        myTypeWriter.layer.cornerRadius = 10
        myTypeWriter.textColor = UIColor.white
        myTypeWriter.textContainerInset = UIEdgeInsetsMake(10 , 5, 0, 5)
        myTypeWriter.isUserInteractionEnabled = false
    }
    class func typeWriterFirst(uiViewController: UIViewController, view: UIView, indexQuestionA: [Int], date: [String], isPositionUp: Bool) -> (Array<String.Element>, UITextView){
        var firstDate = String()
        var secondDate = String()
        var myText = Array<String.Element>()
        let screenSize = ScreenSize()
        let screenDimension = screenSize.identify().0
        let myTypeWriter = HelperFormat.helper(view: view, isPositionUp: true, position: screenDimension)
        TypeWriter.typeWriter(myTypeWriter: myTypeWriter)
        uiViewController.navigationController?.view.addSubview(myTypeWriter)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM d, yyyy"
        if String(date[indexQuestionA[0]]).contains("BC"){
            firstDate = date[indexQuestionA[0]]
            secondDate = date[indexQuestionA[2]]
        }else if String(date[indexQuestionA[0]]).contains("YA"){
            var first = date[indexQuestionA[0]].split(separator: " ")
            firstDate = String(first[0])
            secondDate = date[indexQuestionA[2]]
        }else {
            let dateX = dateFormater.date(from: date[indexQuestionA[0]])
            let dateY = dateFormater.date(from: date[indexQuestionA[2]])
            dateFormater.dateFormat = "MMMM yyyy"
            if let date0 = dateX, let date2 = dateY{
                firstDate = dateFormater.string(from: date0)
                secondDate = dateFormater.string(from: date2)
            }else{
                firstDate = date[indexQuestionA[0]].lastWord
                secondDate = date[indexQuestionA[2]].lastWord
            }
        }
        if firstDate == secondDate {
            myText = Array("""
                Find 3 historic events from:
                
                \(firstDate)
                """)
        }else{
            myText = Array("""
                Find 3 historic events from:
                
                \(firstDate) to \(secondDate)
                """)
        }
        return (myText, myTypeWriter)
    }

    class func typeWriterSecond(uiViewController: UIViewController, view: UIView, isPositionUp: Bool) -> (Array<String.Element>, UITextView){
        var myText = Array<String.Element>()
        let screenSize = ScreenSize()
        let screenDimension = screenSize.identify().0
        let myTypeWriter = HelperFormat.helper(view: view, isPositionUp: isPositionUp, position: screenDimension)
        TypeWriter.typeWriter(myTypeWriter: myTypeWriter)
        uiViewController.navigationController?.view.addSubview(myTypeWriter)
        myText = Array("""

Learn these events and their dates

""")
       return (myText, myTypeWriter)
    }
    class func typeWriterThird(uiViewController: UIViewController, view: UIView, dateLastQuestion: String, isPositionUp: Bool) -> (Array<String.Element>, UITextView){
        var myText = Array<String.Element>()
        let screenSize = ScreenSize()
        let screenDimension = screenSize.identify().0
        let myTypeWriter = HelperFormat.helper(view: view, isPositionUp: isPositionUp, position: screenDimension)
        TypeWriter.typeWriter(myTypeWriter: myTypeWriter)
        uiViewController.navigationController?.view.addSubview(myTypeWriter)
        myText = Array("""
What event happened on this date?

\(dateLastQuestion)
""")
        return (myText, myTypeWriter)
    }
    class func typeWriterFourth(uiViewController: UIViewController, view: UIView, percentage: Int, isPositionUp: Bool, subject: String) -> (UITextView, UIButton){
        //var myText = Array<String.Element>()
        let screenSize = ScreenSize()
        let screenDimension = screenSize.identify().0
        let myTypeWriter = HelperFormat.helper(view: view, isPositionUp: isPositionUp, position: screenDimension)
        TypeWriter.typeWriter(myTypeWriter: myTypeWriter)
        uiViewController.navigationController?.view.addSubview(myTypeWriter)
        let continueQuizButton = ContinueQuizButton.continueQuiz(myTypeWriter: myTypeWriter, view: view)
        uiViewController.navigationController?.view.addSubview(continueQuizButton)

        myTypeWriter.text = """
Great Job!
you have completed \(percentage)%
of \(subject)

"""
        return (myTypeWriter, continueQuizButton)
    }
    
   
}

class TimerAndSequence {
    var myCounter = 0
    var timerTyper = Timer()
    var myTypeWriter: UITextView
    var myText: Array<String.Element>
    var soundPlayer: SoundPlayer?
    
    init (myTypeWriter: UITextView, myText: Array<String.Element>, soundPlayer: SoundPlayer?) {
        self.myTypeWriter = myTypeWriter
        self.myText = myText
        self.soundPlayer = soundPlayer
    }
    func fireTimer(){
        timerTyper = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(typeLetter), userInfo: nil, repeats: true)
    }
    @objc func typeLetter() {
        if myCounter < myText.count {
            myTypeWriter.text = myTypeWriter.text! + String(myText[myCounter])
            let randomInterval = Double((arc4random_uniform(2)+1))/20
            timerTyper.invalidate()
            timerTyper = Timer.scheduledTimer(timeInterval: randomInterval, target: self, selector:  #selector(typeLetter), userInfo: nil, repeats: false)
        } else {
            timerTyper.invalidate()
            soundPlayer?.stopSound()
        }
        myCounter += 1
    }
}
class HelperFormat {
    class func helper(view: UIView, isPositionUp: Bool, position: String) -> UITextView{
        let appleDelegate = AppDelegate()
        let orientation = appleDelegate.rotated()
        let centerHorizontal = view.frame.width * 0.36
        var centerVertical = centerHorizontal * 0.666
        var myTypeWriter = UITextView()
        enum TypeWriterPosition: String {
            case small
            case average
            case large
            case extraLarge
            case extraExtraLarge
            case extraExtraExtraLarge
        }
        switch position {
        case TypeWriterPosition.small.rawValue:
            if isPositionUp {
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.338 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 22)
            }else{
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.69 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 18)
            }
        case TypeWriterPosition.average.rawValue:
            if isPositionUp {
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.316 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 27)
            }else{
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.71 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 22)
            }
        case TypeWriterPosition.large.rawValue:
            if isPositionUp {
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.307 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 30)
            }else{
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.72 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 24)
            }
        case TypeWriterPosition.extraLarge.rawValue:
            if orientation {
                centerVertical = centerHorizontal * 0.4
            }
                if isPositionUp {
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.30 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 54)
                }else{
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.73 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 45)
                }
        case TypeWriterPosition.extraExtraLarge.rawValue:
            if orientation {
                centerVertical = centerHorizontal * 0.4
                if isPositionUp {
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.31 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 57)
                }else{
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.735 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 49)
                }
            }else{
                if isPositionUp {
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.29 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 57)
                }else{
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.735 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 49)
                }
            }

        case TypeWriterPosition.extraExtraExtraLarge.rawValue:
            if orientation {
                centerVertical = centerHorizontal * 0.4
                if isPositionUp {
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.32 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 68)
                }else{
                    myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.735 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                    myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 60)
                }
            }
            if isPositionUp {
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.29 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 68)
            }else{
                myTypeWriter = UITextView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.735 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
                myTypeWriter.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 60)
            }
        default:
            print("There is no such screen")
        }
        return myTypeWriter
    }
}



