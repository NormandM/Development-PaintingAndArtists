//
//  FinishedQuizDiploma.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-31.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class FinishedQuiz {
    class func diploma(uiViewController: UIViewController, view: UIView, viewTitle: String) -> (UITextView, UIButton){
        let appleDelegate = AppDelegate()
        let screenSize = ScreenSize()
        let screenDimension = screenSize.identify().0
        let orientation = appleDelegate.rotated()
        var centerHorizontal = view.frame.width * 0.36
        var centerVertical = centerHorizontal
        let finishedQuizTextView = UITextView()
        finishedQuizTextView.isUserInteractionEnabled = false
        finishedQuizTextView.backgroundColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 0.5)
        finishedQuizTextView.textAlignment = .center
        finishedQuizTextView.layer.masksToBounds = true
        finishedQuizTextView.layer.borderWidth = 5
        finishedQuizTextView.layer.borderColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 1.0).cgColor
        finishedQuizTextView.layer.cornerRadius = 10
        finishedQuizTextView.textColor = UIColor.white
        finishedQuizTextView.textContainerInset = UIEdgeInsetsMake(0, 5, 0, 5)
        finishedQuizTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
        finishedQuizTextView.text = """
        
        
        
        Master of \(viewTitle)
        Congratulations!
        
        
        
        """
        let imageName = "mortarboard.png"
        let diplomaImage = UIImage(named: imageName)
        let diplomaImageView = UIImageView(image: diplomaImage!)
        
        let boutonMenu = UIButton()
        boutonMenu.titleLabel?.textAlignment = NSTextAlignment.center
        boutonMenu.layer.cornerRadius = 15
        boutonMenu.setTitle("Menu", for: .normal)
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
        var finishedQuizTextViewX = finishedQuizTextView.frame.midX
        var finishedQuizTextViewY = finishedQuizTextView.frame.minY
        switch screenDimension {
        case FinishedQuizView.small.rawValue:
            finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 25)
            diplomaImageView.frame = CGRect(origin: CGPoint(x: finishedQuizTextView.frame.width/2 - 37.5, y: finishedQuizTextView.frame.height/25 ), size: CGSize(width: 75, height: 75))
            boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 50, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.25 ), size: CGSize(width: 100, height: 40))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.average.rawValue:
            finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 28)
            diplomaImageView.frame = CGRect(origin: CGPoint(x: finishedQuizTextView.frame.width/2 - 50, y: finishedQuizTextView.frame.height/25 ), size: CGSize(width: 100, height: 100))
            boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 50, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.25 ), size: CGSize(width: 100, height: 40))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.large.rawValue:
            finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 32)
            diplomaImageView.frame = CGRect(origin: CGPoint(x: finishedQuizTextView.frame.width/2 - 50, y: finishedQuizTextView.frame.height/25 ), size: CGSize(width: 100, height: 100))
            boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 50, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.25 ), size: CGSize(width: 100, height: 40))
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case FinishedQuizView.extraLarge.rawValue:
            if orientation {
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                finishedQuizTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                finishedQuizTextViewX = finishedQuizTextView.frame.midX
                finishedQuizTextViewY = finishedQuizTextView.frame.minY
                boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 100, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.225 ), size: CGSize(width: 200, height: 60))
            }else{
                boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 100, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }
            finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 58)
            diplomaImageView.frame = CGRect(origin: CGPoint(x: finishedQuizTextView.frame.width/2 - 85, y: finishedQuizTextView.frame.height/25 ), size: CGSize(width: 170, height: 170))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        case FinishedQuizView.extraExtraLarge.rawValue:
            if orientation {

                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                finishedQuizTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                finishedQuizTextViewX = finishedQuizTextView.frame.midX
                finishedQuizTextViewY = finishedQuizTextView.frame.minY
                finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 58)
                boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 100, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }else{
                finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 64)
                boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 100, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }
            diplomaImageView.frame = CGRect(origin: CGPoint(x: finishedQuizTextView.frame.width/2 - 85, y: finishedQuizTextView.frame.height/25 ), size: CGSize(width: 170, height: 170))
            
            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        case FinishedQuizView.extraExtraExtraLarge.rawValue:
            if orientation {
                centerHorizontal = view.frame.width * 0.25
                centerVertical = centerHorizontal
                finishedQuizTextView.frame = CGRect(origin: CGPoint(x: view.frame.width/2 - centerHorizontal, y: view.frame.height/2 - centerVertical), size: CGSize(width: centerHorizontal * 2, height: centerVertical * 2))
                finishedQuizTextViewX = finishedQuizTextView.frame.midX
                finishedQuizTextViewY = finishedQuizTextView.frame.minY
                finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 68)
                boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 100, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }else{
                finishedQuizTextView.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 78)
                boutonMenu.frame = CGRect(origin: CGPoint(x: finishedQuizTextViewX - 100, y: finishedQuizTextViewY + finishedQuizTextView.frame.height/1.2 ), size: CGSize(width: 200, height: 60))
            }
            diplomaImageView.frame = CGRect(origin: CGPoint(x: finishedQuizTextView.frame.width/2 - 100, y: finishedQuizTextView.frame.height/25 ), size: CGSize(width: 200, height: 200))

            boutonMenu.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        default:
            print("There is no such screen")
        
        }
        uiViewController.navigationController?.view.addSubview(finishedQuizTextView)
        finishedQuizTextView.addSubview(diplomaImageView)
        uiViewController.navigationController?.view.addSubview(boutonMenu)
        return (finishedQuizTextView, boutonMenu)
    }
}
