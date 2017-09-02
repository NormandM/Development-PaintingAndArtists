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
    var questionArray: QuestionArray
    var counter: Int
    var isAllDatesDisplayed:Bool = false
    let tableView: UITableView
    let tableView1: UITableView
    let totalCycle: Int
    let viewController = QuizViewController()
    let tableCell = CellForTableView()
    init (tableView: UITableView, tableView1: UITableView, totalCycle: Int, counter: Int, questionArray: QuestionArray) {
        self.questionArray = questionArray
        self.tableView = tableView
        self.tableView1 = tableView1
        self.totalCycle = totalCycle
        self.counter = counter
        
    }
    func runTimedCode() -> (Bool, QuestionArray) {
        if totalCycle > 0 {
            let cellDate = tableCell.definedBy(tableView: tableView, index: counter - 1)
            let cellEvent = tableCell.definedBy(tableView: tableView1, index: counter)
            cellDate.dateCellLabel.text = questionArray.questionDates[counter - 1]
            cellDate.isHidden = false
            cellDate.dateCellLabel.textColor = UIColor.blue
            cellEvent.displayGrayEventCell(cell: cellEvent)
            cellEvent.isHidden = true

        }else{
            isAllDatesDisplayed = true
            var n = 0
            questionArray = questionArray.rearangeForQuiz()
            for event in questionArray.questionArray {
                let cellEvent = tableCell.definedBy(tableView: tableView1, index: n)
                cellEvent.isHidden = false
                cellEvent.eventCellLabel.text = event.0
                cellEvent.eventCellLabel.textColor = UIColor.blue
                n = n + 1
            }
            let cellEvent = tableCell.definedBy(tableView: tableView1, index: n - 1)
            cellEvent.displayGrayEventCell(cell: cellEvent)
            n = 0
            for _ in questionArray.dateArray{
                if n > 4{
                    let cellDate = tableCell.definedBy(tableView: tableView, index: n)
                    cellDate.dateCellLabel?.text = ""
                }
                n = n + 1
                
            }
        }
        
        return (isAllDatesDisplayed, questionArray)
    }
    
}
