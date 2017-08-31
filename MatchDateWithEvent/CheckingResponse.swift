//
//  CheckingResponse.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-26.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class CheckResponse {
    //let historicalData: HistoricalData
    var questionArray: QuestionArray
    let tableView1: UITableView
    var counter: Int
    var labelIsDropped: Bool
    var tableCell = CellForTableView()
    
    init(questionArray: QuestionArray, tableView1: UITableView, counter: Int, labelIsDropped: Bool){
        self.questionArray = questionArray
        self.tableView1 = tableView1
        self.counter = counter
        self.labelIsDropped = labelIsDropped
    }
    func checkResponse () -> Bool{
        counter = counter - 1
        var responseIsGood: Bool = false
        let shake = Shake()
        let progress: Double = Double(counter)
        if progress < 0 || labelIsDropped == true{
            let finaltEvent = questionArray.questionArray.dropLast(4)
            let finalDate = questionArray.dateArray.dropLast(4)
            var n = 0
            responseIsGood = false
            for _ in finalDate {
                if finalDate[n].1 != finaltEvent[n].1{
                    responseIsGood = false
                    break
                }else{
                    responseIsGood = true
                }
                n = n + 1
            }
            if responseIsGood {
                for n in 0 ... 4 {
                    let cellEvent = tableCell.definedBy(tableView: tableView1, index: n)
                    cellEvent.displayGreenEventCell(cell: cellEvent)
                    shake.shakeViewVertical(vw: cellEvent.eventCellLabel)
                }
            }else{
                for n in 0 ... 4 {
                    let cellEvent = tableCell.definedBy(tableView: tableView1, index: n)
                    cellEvent.displayRedEventCell(cell: cellEvent)
                    shake.shakeViewHorizontal(vw: cellEvent.eventCellLabel)
                }
                
            }
            for n in 5 ... 6 {
                let cellEvent = tableCell.definedBy(tableView: tableView1, index: n)
                cellEvent.isHidden = true
            }
            
        }
        return responseIsGood
    }
    func allAnswered() -> Bool {
        let cellEvent0 = tableCell.definedBy(tableView: tableView1, index: 0)
        let cellEvent1 = tableCell.definedBy(tableView: tableView1, index: 1)
        let cellEvent2 = tableCell.definedBy(tableView: tableView1, index: 2)
        let cellEvent3 = tableCell.definedBy(tableView: tableView1, index: 3)
        let cellEvent4 = tableCell.definedBy(tableView: tableView1, index: 4)
        if (cellEvent0.eventCellLabel.text != "" && cellEvent1.eventCellLabel.text != "" && cellEvent2.eventCellLabel.text != "" && cellEvent3.eventCellLabel.text != "" && cellEvent4.eventCellLabel.text != ""){
            labelIsDropped = true
        }else{
            labelIsDropped = false
        }
        return labelIsDropped
    }
    
    
}
