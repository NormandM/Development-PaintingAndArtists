//
//  HistoricalData.swift
//  DateTest3
//
//  Created by Normand Martin on 17-07-15.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation

struct  HistoricalData {
  var historicalEvent: [(String, Int)]
    var historicalDate: [(String, Int)]
}

extension HistoricalData {
    mutating func shuffle() {
        let countHistoricalEvent = historicalEvent.count
        if countHistoricalEvent < 2 {return}
        var i = 0
        while i < countHistoricalEvent {
            let j = Int(arc4random_uniform(UInt32(countHistoricalEvent)))
            if i != j{
                swap(&historicalEvent[i], &historicalEvent[j])
                //swap(&historicalDate[i], &historicalDate[j])
            }
            i = i + 1
        }
        
    }
}
