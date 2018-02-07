//
//  ScreennSize.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-12-04.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

struct ScreenSize {
    let screenSize = UIScreen.main.bounds
    func identify() ->  (String, UIFont, UIFont, UIFont, UIFont, CGFloat?, CGFloat?, CGFloat?, CGFloat?){
        var fontSize = UIFont()
        var fontSize2 = UIFont()
        var fontSize3 = UIFont()
        var fontSize4 = UIFont()
        var constantLabelThirdEventCenter: CGFloat? = nil
        var constantButtonFirstEventCenter: CGFloat? = nil
        var constantFirstDateLabelCenterX: CGFloat? = nil
        var constantFirstEventCenterX: CGFloat? = nil
        
        let appleDelegate = AppDelegate()
        let orientation = appleDelegate.rotated()
        var screenDimension = String()
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let surfaceScreen = screenWidth * screenHeight
        if surfaceScreen < 200000 {
            screenDimension = "small"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 11)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 11)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 15.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 15.0)!
        }else if surfaceScreen > 200000 && surfaceScreen < 300000 {
            screenDimension = "average"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 13)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 13)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 15.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 15.0)!
        }else if surfaceScreen > 300000 && surfaceScreen < 700000 {
            screenDimension = "large"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 16)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 16)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 22.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 15.0)!
        }else if surfaceScreen > 700000 && surfaceScreen < 800000{
            screenDimension = "extraLarge"
            constantLabelThirdEventCenter = -60
            constantButtonFirstEventCenter = 100
            constantFirstDateLabelCenterX = 200
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 20)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 18)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 26.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 15.0)!
            if orientation{
                constantButtonFirstEventCenter = 65
                constantLabelThirdEventCenter = -40
                constantFirstDateLabelCenterX = 300
                constantFirstEventCenterX = 50
            }
        }else if surfaceScreen > 800000 && surfaceScreen < 1000000{
            screenDimension = "extraExtraLarge"
            constantLabelThirdEventCenter = -60
            constantButtonFirstEventCenter = 100
            constantFirstDateLabelCenterX = 200
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 26)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 22)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 32.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 15.0)!
            if orientation{
                constantButtonFirstEventCenter = 85
                constantLabelThirdEventCenter = -40
                constantFirstDateLabelCenterX = 300
                constantFirstEventCenterX = 50
            }
        }else if surfaceScreen > 1000000{
            screenDimension = "extraExtraExtraLarge"
            constantLabelThirdEventCenter = -100
            constantButtonFirstEventCenter = 150
            constantFirstDateLabelCenterX = 250
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 35)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 30)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 35.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 15.0)!
            if orientation{
                constantButtonFirstEventCenter = 110
                constantLabelThirdEventCenter = -60
                constantFirstDateLabelCenterX = 400
                constantFirstEventCenterX = 50
            }
        }
        return (screenDimension, fontSize, fontSize2, fontSize3, fontSize4, constantLabelThirdEventCenter, constantButtonFirstEventCenter, constantFirstDateLabelCenterX, constantFirstEventCenterX)
    }
}
