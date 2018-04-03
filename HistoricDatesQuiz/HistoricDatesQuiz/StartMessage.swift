//
//  StartMessage.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-03-15.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class StartMessage {
    class func message(uiViewController: UIViewController, view: UIView) -> (UITextView, UIButton){
        let appleDelegate = AppDelegate()
        let screenSize = ScreenSize()
        let screenDimension = screenSize.identify().0
        let orientation = appleDelegate.rotated()
        var centerHorizontal = view.frame.width * 0.4
        var centerVertical = centerHorizontal
        let startTextView = UITextView()
        let iconeView = UIImageView(frame: CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height * 0.338 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2)))
        startTextView.addSubview(iconeView)
        startTextView.isUserInteractionEnabled = false
        startTextView.backgroundColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 0.5)
        startTextView.textAlignment = .natural
        startTextView.layer.masksToBounds = true
        startTextView.layer.borderWidth = 5
        startTextView.layer.borderColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 1.0).cgColor
        startTextView.layer.cornerRadius = 10
        startTextView.textColor = UIColor.white
        startTextView.textContainerInset = UIEdgeInsetsMake(0, 5, 0, 5)
        startTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
        
        startTextView.text = """
        
        
        
        
             Welcome to LEARN HISTORY
        
        - This is not a quiz.
        - It is a game-tool to learn
          historic dates and events.
        - You don't know the answers at first,
          you learn.
        - Take your time, have fun, learn!
        """
        let imageName = "Icone high res 1024px.png"
        let iconeImage = UIImage(named: imageName)
        let iconeImageView = UIImageView(image: iconeImage!)
        iconeImageView.layer.cornerRadius = 10.0
        iconeImageView.clipsToBounds = true
        
        let boutonMenu = UIButton()
        boutonMenu.titleLabel?.textAlignment = NSTextAlignment.center
        boutonMenu.layer.cornerRadius = 10
        boutonMenu.setTitle("OK", for: .normal)
        boutonMenu.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        boutonMenu.titleLabel?.textColor = UIColor.white
        boutonMenu.showsTouchWhenHighlighted = true
        
        enum FinishedQuizView: String {
            case small
            case average
            case large
            case extraLarge
            case extraExtraLarge
            case extraExtraExtraLarge
        }
        var startTextViewX = startTextView.frame.midX
        var startTextViewY = startTextView.frame.minY
        switch screenDimension {
        case FinishedQuizView.small.rawValue:
            startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 15)
            iconeImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 25, y: startTextView.frame.height/25 ), size: CGSize(width: 50, height: 50))
            boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 25, y: startTextViewY + startTextView.frame.height/1.18 ), size: CGSize(width: 50, height: 25))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.average.rawValue:
            startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 17)
            iconeImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 30, y: startTextView.frame.height/25 ), size: CGSize(width: 55, height: 55))
            boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 30, y: startTextViewY + startTextView.frame.height/1.18 ), size: CGSize(width: 60, height: 24))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.large.rawValue:
            startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 20)
            iconeImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 32.5, y: startTextView.frame.height/25 ), size: CGSize(width: 65, height: 65))
            boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 32.5, y: startTextViewY + startTextView.frame.height/1.15 ), size: CGSize(width: 65, height: 26))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.extraLarge.rawValue:
            if orientation {
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                startTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - (centerVertical - 25)), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                startTextViewX = startTextView.frame.midX
                startTextViewY = startTextView.frame.minY
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 32)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 50, y: startTextViewY + startTextView.frame.height/1.12 ), size: CGSize(width: 100, height: 40))
            }else{
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 37)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 50, y: startTextViewY + startTextView.frame.height/1.15 ), size: CGSize(width: 100, height: 40))
            }
            
            iconeImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 50, y: startTextView.frame.height/25 ), size: CGSize(width: 100, height: 100))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        case FinishedQuizView.extraExtraLarge.rawValue:
            if orientation {
                
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                startTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - (centerVertical - 20)), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                startTextViewX = startTextView.frame.midX
                startTextViewY = startTextView.frame.minY
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 34)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 50, y: startTextViewY + startTextView.frame.height/1.15 ), size: CGSize(width: 100, height: 40))
            }else{
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 40)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 50, y: startTextViewY + startTextView.frame.height/1.15 ), size: CGSize(width: 100, height: 40))
            }
            iconeImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 50, y: startTextView.frame.height/25 ), size: CGSize(width: 120, height: 120))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        case FinishedQuizView.extraExtraExtraLarge.rawValue:
            if orientation {
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                startTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - (centerVertical - 20)), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                startTextViewX = startTextView.frame.midX
                startTextViewY = startTextView.frame.minY
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 42)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 75, y: startTextViewY + startTextView.frame.height/1.12 ), size: CGSize(width: 150, height: 50))
            }else{
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 50)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 75, y: startTextViewY + startTextView.frame.height/1.12 ), size: CGSize(width: 150, height: 50))
            }
            iconeImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 75, y: startTextView.frame.height/25 ), size: CGSize(width: 150, height: 150))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        default:
            print("There is no such screen")
            
        }
        uiViewController.navigationController?.view.addSubview(startTextView)
       startTextView.addSubview(iconeImageView)
        uiViewController.navigationController?.view.addSubview(boutonMenu)
        return (startTextView, boutonMenu)
    }

}
