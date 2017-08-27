//
//  QuestionTimer.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-26.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class QuestionTimer {
    //var historicalData = HistoricalData()
    var questionArray: QuestionArray
    var counter: Int
    var isAllDatesDisplayed:Bool = false
    let tableView: UITableView
    let tableView1: UITableView
    let totalCycle: Int
    let viewController = QuizViewController()
    init (tableView: UITableView, tableView1: UITableView, totalCycle: Int, counter: Int, questionArray: QuestionArray) {
        self.questionArray = questionArray
        self.tableView = tableView
        self.tableView1 = tableView1
        self.totalCycle = totalCycle
        self.counter = counter
        
    }
    func runTimedCode() -> (Bool, QuestionArray) {
        
        if totalCycle > 0 {
            let cellDate = tableView.cellForRow(at: [0, counter]) as! CellForTableView
            let cellEvent = tableView1.cellForRow(at: [0, counter]) as! CellForTableView
            cellDate.dateCellLabel.textColor = UIColor.blue
            cellEvent.displayGrayEventCell(cell: cellEvent)
            cellEvent.isHidden = true
            
        }else{
            isAllDatesDisplayed = true
            var n = 0
            for _ in questionArray.questionArray {
                let cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
                cellEvent.eventCellLabel.textColor = UIColor.white
                n = n + 1
            }
            n = 0
            questionArray = questionArray.rearangeForQuiz()
            for event in questionArray.questionArray {
                let cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
                cellEvent.isHidden = false
                cellEvent.eventCellLabel.text = event.0
                cellEvent.eventCellLabel.textColor = UIColor.blue
                n = n + 1
            }
            let cellEvent = tableView1.cellForRow(at: [0, n - 1]) as! CellForTableView
            cellEvent.displayGrayEventCell(cell: cellEvent)
            n = 0
            for _ in questionArray.dateArray{
                if n > 4{
                    let cellDate = tableView.cellForRow(at: [0, n]) as! CellForTableView
                    cellDate.dateCellLabel?.text = ""
                }
                n = n + 1
                
            }
        }
        
        return (isAllDatesDisplayed, questionArray)
    }
    
}
