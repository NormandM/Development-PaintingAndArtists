//
//  FontsAndConstraints.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-06-02.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

struct FontsAndConstraints {
    let screenSize = UIScreen.main.bounds
    
    func size() ->  (String, UIFont, UIFont, UIFont, UIFont, UIFont, UIFont, UIFont, CGFloat){
        var screenDimension = String()
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let surfaceScreen = screenWidth * screenHeight
        var bioTextConstraint = CGFloat()
        var fontSize = UIFont()
        var fontSize2 = UIFont()
        var fontSize3 = UIFont()
        var fontSize4 = UIFont()
        var fontSize5 = UIFont()
        var fontSize6 = UIFont()
        var fontSize7 = UIFont()
        if surfaceScreen < 200000 {
            screenDimension = "small"
            bioTextConstraint = 30
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 12)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 14)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 15.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 16.0)!
            fontSize5 = UIFont(name: "HelveticaNeue-Italic",size: 22.0)!
            fontSize6 = UIFont(name: "Helvetica-Bold",size: 22.0)!
            fontSize7 = UIFont(name: "HelveticaNeue",size: 30.0)!
        }else if surfaceScreen > 200000 && surfaceScreen < 304600 {
            screenDimension = "average"
            bioTextConstraint = 50
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 16)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 18)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 15.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 20.0)!
            fontSize5 = UIFont(name: "HelveticaNeue-Italic",size: 24.0)!
            fontSize6 = UIFont(name: "Helvetica-Bold",size: 24.0)!
            fontSize7 = UIFont(name: "HelveticaNeue",size: 40.0)!
        }else if surfaceScreen > 304600 && surfaceScreen < 700000 {
            screenDimension = "large"
            bioTextConstraint = 50
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 18)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 18)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 22.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 22.0)!
            fontSize5 = UIFont(name: "HelveticaNeue-Italic",size: 29.0)!
            fontSize6 = UIFont(name: "Helvetica-Bold",size: 29.0)!
            fontSize7 = UIFont(name: "HelveticaNeue",size: 40.0)!
        }else if surfaceScreen > 700000 && surfaceScreen < 800000{
            screenDimension = "extraLarge"
            bioTextConstraint = 70
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 30)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 25)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 26.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 35.0)!
            fontSize5 = UIFont(name: "HelveticaNeue-Italic",size: 33.0)!
            fontSize6 = UIFont(name: "Helvetica-Bold",size: 33.0)!
            fontSize7 = UIFont(name: "HelveticaNeue",size: 40.0)!
        }else if surfaceScreen > 800000 && surfaceScreen < 1000000{
            screenDimension = "extraExtraLarge"
            bioTextConstraint = 100
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 28)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 30)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 34.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 32.0)!
            fontSize5 = UIFont(name: "HelveticaNeue-Italic",size: 40.0)!
            fontSize6 = UIFont(name: "Helvetica-Bold",size: 40.0)!
            fontSize7 = UIFont(name: "HelveticaNeue",size: 50.0)!
        }else if surfaceScreen > 1000000{
            screenDimension = "extraExtraExtraLarge"
            bioTextConstraint = 100
            fontSize = UIFont(name: "HelveticaNeue-Italic", size: 30)!
            fontSize2 = UIFont(name: "HelveticaNeue-Bold", size: 32)!
            fontSize3 =  UIFont(name: "Helvetica-LightOblique", size: 36.0)!
            fontSize4 = UIFont(name: "Helvetica-Bold",size: 35.0)!
            fontSize5 = UIFont(name: "HelveticaNeue-Italic",size: 45.0)!
            fontSize6 = UIFont(name: "Helvetica-Bold",size: 45.0)!
            fontSize7 = UIFont(name: "HelveticaNeue",size: 40.0)!
        }
        return (screenDimension, fontSize, fontSize2, fontSize3, fontSize4, fontSize5, fontSize6, fontSize7, bioTextConstraint)
    }

}
