//
//  ImportingPlist.swift
//  CoreDataClassification
//
//  Created by Normand Martin on 18-02-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import Foundation
class AllHistoricalData {
    class func parsingData() -> [[String]] {
        var historicalDataArray: [[String]] = []
        if let plistPath = Bundle.main.path(forResource: "HistoryAll", ofType: "plist"), let historicalNSArray = NSArray(contentsOfFile: plistPath){
            historicalDataArray = historicalNSArray as! [[String]]
        }
        return historicalDataArray
    }
}
