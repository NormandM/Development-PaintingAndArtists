//
//  FetchingDataForQuiz.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-29.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import Foundation
class FetchDataForQuiz {
    class func fetchData(selectedTitle: String) -> [Event]{
        var event: [Event]? = nil
        var numberOfQuizCompleted = 0
        var quiz = [Event]()
        var n = 0
        var reference = 0
        event = CodeDataHandler.fetchObject()
        if let event = event{
            for events in event {
                if events.isCompleted && events.selectedTitle == selectedTitle{
                    numberOfQuizCompleted = numberOfQuizCompleted + 1
                    events.numberCompleted = Int32(numberOfQuizCompleted)
                    if !CodeDataHandler.saveSingleObject(event: events) {
                        print("Nothing was saved")
                    }

                }else if events.selectedTitle == selectedTitle{
                    reference = n
                    break
                }
                n = n + 1
            }
            if event[reference].selectedTitle == selectedTitle {
                for n in reference ... reference + 5 {
                    quiz.append(event[n])
                }
            }else{
                quiz = []
            }

        }
        return quiz
    }

}
