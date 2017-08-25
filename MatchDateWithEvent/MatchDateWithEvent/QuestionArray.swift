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
    let historicalData = HistoricalData()
    let viewController = QuizSelectionTableViewController()
    init() {
        for event in historicalData.historicalDataArray {
            if event[1] == viewController.sectionDetail{
                firstQuestion = event[3]
                break
            }
        }
        var n = 0
        for _ in historicalData.historicalEvent {
            if firstQuestion == historicalData.historicalEvent[n].0 {
                for i in n ... n + 6 {
                    questionArray.append(historicalData.historicalEvent[i])
                    dateArray.append(historicalData.historicalDate[i])
                    questionEvents.append(historicalData.historicalEvent[i].0)
                    questionDates.append(historicalData.historicalDate[i].0)
                }
                break
            }
            n = n + 1
        }
        
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
        let questions = QuestionArray()
        questions.questionArray.removeLast()
        questionEvents.removeLast()
        //historicalData.historicalEvent.removeLast()
        questions.shuffle()
        questions.questionArray.insert(("", 6), at: 0)
        return questions
        
    }

    
}
