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
          historic dates ans events.
        - Take your time, have fun, learn!
        """
//        let imageName = "mortarboard.png"
//        let diplomaImage = UIImage(named: imageName)
//        let diplomaImageView = UIImageView(image: diplomaImage!)
        
        let boutonMenu = UIButton()
        boutonMenu.titleLabel?.textAlignment = NSTextAlignment.center
        boutonMenu.layer.cornerRadius = 15
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
            startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 16)
//            diplomaImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 37.5, y: startTextView.frame.height/25 ), size: CGSize(width: 75, height: 75))
            boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 50, y: startTextViewY + startTextView.frame.height/1.25 ), size: CGSize(width: 100, height: 40))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.average.rawValue:
            startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 18)
//            diplomaImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 50, y: startTextView.frame.height/25 ), size: CGSize(width: 100, height: 100))
            boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 50, y: startTextViewY + startTextView.frame.height/1.25 ), size: CGSize(width: 100, height: 40))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.large.rawValue:
            startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 20)
//            diplomaImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 50, y: startTextView.frame.height/25 ), size: CGSize(width: 100, height: 100))
            boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 50, y: startTextViewY + startTextView.frame.height/1.25 ), size: CGSize(width: 100, height: 40))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.extraLarge.rawValue:
            if orientation {
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                startTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                startTextViewX = startTextView.frame.midX
                startTextViewY = startTextView.frame.minY
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 34)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 100, y: startTextViewY + startTextView.frame.height/1.225 ), size: CGSize(width: 200, height: 60))
            }else{
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 40)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 100, y: startTextViewY + startTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }
            
//            diplomaImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 85, y: startTextView.frame.height/25 ), size: CGSize(width: 170, height: 170))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        case FinishedQuizView.extraExtraLarge.rawValue:
            if orientation {
                
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                startTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                startTextViewX = startTextView.frame.midX
                startTextViewY = startTextView.frame.minY
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 38)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 100, y: startTextViewY + startTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }else{
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 46)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 100, y: startTextViewY + startTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }
 //           diplomaImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 85, y: startTextView.frame.height/25 ), size: CGSize(width: 170, height: 170))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        case FinishedQuizView.extraExtraExtraLarge.rawValue:
            if orientation {
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                startTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                startTextViewX = startTextView.frame.midX
                startTextViewY = startTextView.frame.minY
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 47)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 100, y: startTextViewY + startTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }else{
                startTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 56)
                boutonMenu.frame = CGRect(origin: CGPoint(x: startTextViewX - 100, y: startTextViewY + startTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }
//            diplomaImageView.frame = CGRect(origin: CGPoint(x: startTextView.frame.width/2 - 100, y: startTextView.frame.height/25 ), size: CGSize(width: 200, height: 200))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        default:
            print("There is no such screen")
            
        }
        uiViewController.navigationController?.view.addSubview(startTextView)
//       startTextView.addSubview(diplomaImageView)
        uiViewController.navigationController?.view.addSubview(boutonMenu)
        return (startTextView, boutonMenu)
    }

}
