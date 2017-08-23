//
//  HistoricalData.swift
//  DateTest3
//
//  Created by Normand Martin on 17-07-15.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation

class  HistoricalData {

    var sectionHeaderTable: [String] = []
    var sectionHeaderTable1: [String] = ["Drag and drop events"]
    static var historicalDataArray: [[String]] = []
    static var historicalEvent: [(String, Int)] = []
    static var historicalDate: [(String, Int)] = []
    static var detailEvent: [String] = []
    static var timeUnit: [String] = []
    init () {
        if let plistPath = Bundle.main.path(forResource: "DataHistorical", ofType: "plist"),
            let historicalNSArray = NSArray(contentsOfFile: plistPath){
            HistoricalData.historicalDataArray = historicalNSArray as! [[String]]
        }
        let count = HistoricalData.historicalDataArray.count
        var i = 0
        for n in 0 ... count - 1 {
            HistoricalData.historicalEvent.append((HistoricalData.historicalDataArray[n][3], i))
            HistoricalData.historicalDate.append((HistoricalData.historicalDataArray[n][2], i))
            sectionHeaderTable.append(HistoricalData.historicalDataArray[n][0])
            HistoricalData.detailEvent.append(HistoricalData.historicalDataArray[n][01])
            HistoricalData.timeUnit.append(HistoricalData.historicalDataArray[n][04])
            i = i + 1
            if i == 6 {
                HistoricalData.historicalEvent.append(("", 6))
                HistoricalData.historicalDate.append(("", 6))
                    i = 0
            }
        }
        
    }
}


