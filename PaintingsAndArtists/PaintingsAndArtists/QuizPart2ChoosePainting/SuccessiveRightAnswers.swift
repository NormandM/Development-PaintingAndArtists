//
//  SuccessiveRightAnswers.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-18.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class SuccessiveAnswer {
    class func progression (commentAfterResponse: SpecialLabel, painterName: String, totalPaintings: Int) -> (SpecialLabel, Int){
        let successiveRightAnswers =  UserDefaults.standard.integer(forKey: "successiveRightAnswers")
        var totalQuestion = Int()
        switch successiveRightAnswers {
        case 0, 1, 2, 3, 4:
            commentAfterResponse.text = """
            Great!
            You recognized
            \(painterName)'s style.
            
            1 coin bonnus was added to your credits
            """
            totalQuestion = 5
        case 5:
            commentAfterResponse.text = """
            Art Amateur!
            You had 5 consecutives right answers.
            
            A 5 coins bonnus was added to your credits
            """
            CreditManagment.increaseFiveCredit()
            totalQuestion = 5
        case 6 ... 14:
            commentAfterResponse.text = """
            Great!
            You recognized
            \(painterName)'s style.
            
            1 coin bonnus was added to your credits
            """
            totalQuestion = 15
        case 15:
            commentAfterResponse.text = """
            Art Connoisseur!
            You had 15 consecutives right answers.
            
            A 15 coins bonnus was added to your credits
            """
            CreditManagment.increaseFiftheenCredit()
            totalQuestion = 15
        case 16 ... 29:
            commentAfterResponse.text = """
            Great!
            You recognized
            \(painterName)'s style.
            
            1 coin bonnus was added to your credits
            """
            totalQuestion = 30
        case 30:
            commentAfterResponse.text = """
            Art Expert!
            You had 30 consecutives right answers.
            
            A 30 coins bonnus was added to your credits
            """
            CreditManagment.increaseThirtyCredit()
            totalQuestion = 30
        case 31 ... 49:
            commentAfterResponse.text = """
            Great!
            You recognized
            \(painterName)'s style.
            
            1 coin bonnus was added to your credits
            """
            totalQuestion = 50
        case 50:
            commentAfterResponse.text = """
            Art Scholar!
            You had 50 consecutives right answers.
            
            A 50 coins bonnus was added to your credits
            """
            CreditManagment.increseFiftyCredit()
            totalQuestion = totalPaintings
        case totalPaintings:
            commentAfterResponse.text = """
            Fantastic!
            You know all the paintings!
            
            A 1000 coins bonnus was added to your credits
            """
            CreditManagment.increseOneThousandCredit()
        default:
            commentAfterResponse.text = """
            Great!
            You recognized
            \(painterName)'s style.
            1 coin bonnus was added to your credits
            """
            totalQuestion = totalPaintings
        }
        return (commentAfterResponse, totalQuestion)
    }
}
