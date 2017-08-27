//
//  HistoricalData.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-22.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit
class  HistoricalData {
    
    var sectionHeaderTable: [String] = []
    var sectionHeaderTable1: [String] = ["Drag and drop events"]
    var historicalDataArray: [[String]] = []
    var historicalEvent: [(String, Int)] = []
    var historicalDate: [(String, Int)] = []
    var detailEvent: [String] = []
    var timeUnit: [String] = []
    init () {
        if let plistPath = Bundle.main.path(forResource: "DataHistorical", ofType: "plist"),
            let historicalNSArray = NSArray(contentsOfFile: plistPath){
            historicalDataArray = historicalNSArray as! [[String]]
        }
        let count = historicalDataArray.count
        var i = 0
        for n in 0 ... count - 1 {
            historicalEvent.append((historicalDataArray[n][3], i))
            historicalDate.append((historicalDataArray[n][2], i))
            sectionHeaderTable.append(historicalDataArray[n][0])
            detailEvent.append(historicalDataArray[n][01])
            timeUnit.append(historicalDataArray[n][04])
            i = i + 1
            if i == 7 {i = 0}
            
        }
    }
}
