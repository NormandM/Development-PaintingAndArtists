//
//  SuccessiveRightAnswers.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-18.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class SuccessiveAnswer {
    class func progression (commentAfterResponse: UILabel, painterName: String) -> (UILabel, Int){
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
            CreditManagment.increaseOneCredit(hintButton: nil)
        case 5:
            commentAfterResponse.text = """
            Art Amateur!
            You had 5 consecutives right answers
            a 5 coins bonnus was added to your credits
            """
            CreditManagment.increaseFiveCredit()
            totalQuestion = 15
        case 15:
            commentAfterResponse.text = """
            Art Connoisseur!
            You had 15 consecutives right answers
            a 15 coins bonnus was added to your credits
            """
            totalQuestion = 30
        case 30:
            commentAfterResponse.text = """
            Art Expert!
            You had 30 consecutives right answers
            a 30 coins bonnus was added to your credits
            """
            totalQuestion = 50
        case 50:
            commentAfterResponse.text = """
            Art Scholar!
            You had 50 consecutives right answers
            a 50 coins bonnus was added to your credits
            """
        default:
            commentAfterResponse.text = ""
        }
        return (commentAfterResponse, totalQuestion)
    }
}
