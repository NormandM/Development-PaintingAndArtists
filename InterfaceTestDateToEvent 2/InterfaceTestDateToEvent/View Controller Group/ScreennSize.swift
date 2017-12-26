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
    func identify() ->  (String, UIFont, UIFont, UIFont, UIFont){
        var fontSize = UIFont()
        var fontSize2 = UIFont()
        var fontSize3 = UIFont()
        var fontSize4 = UIFont()
        var screenDimension = String()
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let surfaceScreen = screenWidth * screenHeight
        if surfaceScreen < 200000 {
            screenDimension = "small"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 12)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 12)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 12.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 15.0)!
        }else if surfaceScreen > 200000 && surfaceScreen < 300000 {
            screenDimension = "average"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 14)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 14)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 14.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 17.0)!
        }else if surfaceScreen > 300000 && surfaceScreen < 700000 {
            screenDimension = "large"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 15)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 15)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 15.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 18.0)!
        }else if surfaceScreen > 700000 && surfaceScreen < 100000{
            screenDimension = "extraLarge"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 22)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 22)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 21.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 24.0)!
        }else if surfaceScreen > 100000{
            screenDimension = "extraExtraLarge"
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 22)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 22)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 21.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 24.0)!
        }
        return (screenDimension, fontSize, fontSize2, fontSize3, fontSize4)
    }
}
