//
//  QuestionArray.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-22.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
class QuestionArray {
    var questionArray: [(String, Int)] = []
    var questionEvents: [String] = []
    var questionDates: [String] = []
    var dateArray: [(String, Int)] = []
    var firstQuestion = ""
    var sectionDetail: String
    let historicalData = HistoricalData()
    init(sectionDetail: String) {
        self.sectionDetail = sectionDetail
        var n = 0
        for event in historicalData.historicalDataArray {
            
            if event[1] == sectionDetail {
                let questionTransit = (event[3], n)
                let dateTransit = (event[2], n)
                questionArray.append(questionTransit)
                dateArray.append(dateTransit)
                questionEvents.append(event[3])
                questionDates.append(event[2])
                n = n + 1
            }
        }
        questionEvents.append("")
        questionDates.append("")
        let transitQuestionArray = ("", 6)
        questionArray.append(transitQuestionArray)
    }
    
}
extension QuestionArray {
    func shuffle() {
        let countHistoricalEvent = questionArray.count
        if countHistoricalEvent < 2 {return}
        var i = 0
        while i < countHistoricalEvent {
            let j = Int(arc4random_uniform(UInt32(countHistoricalEvent)))
            if i != j{
                swap(&questionArray[i], &questionArray[j])
            }
            i = i + 1
        }
    }
    func rearangeForQuiz() -> QuestionArray{
        let questions = QuestionArray(sectionDetail: sectionDetail)
        questions.questionArray.removeLast()
        questionEvents.removeLast()
        questions.shuffle()
        questions.questionArray.insert(("", 6), at: 0)
        return questions
        
    }
    
    
}
