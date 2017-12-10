//
//  HistoricalData.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-11-27.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
// class that presents data into various forms needed for the apps
class  HistoricalData {
    var questionGroup: String
    var date: [String] = []
    var event: [String] = []
    var units: [String] = []
    var historicalSection: [String] = []
    var historicalSubjectList: [[String]] = []
    var historicalDataArray: [[String]] = []
    init (questionGroup: String) {
        if let plistPath = Bundle.main.path(forResource: "DataHistorical", ofType: "plist"),
            let historicalNSArray = NSArray(contentsOfFile: plistPath){
            historicalDataArray = historicalNSArray as! [[String]]
        }
        
        self.questionGroup = questionGroup
        var n = 0
        var indexN = 0
        var counter = 0
        for historicalData in historicalDataArray{
            
            // Next two lines: Filtering to get broad Sections such as Beginning of the usiniverse
            if !historicalSection.contains(historicalData[0]) {
                historicalSection.append(historicalData[0])
            }
            // Next four lines determining date array and event array
            if historicalData[1] == questionGroup && counter < 5{
                date.append(historicalData[2])
                event.append(historicalData[3])
                units.append(historicalData[4])
                counter = counter + 1
                indexN = n
            }
            n = n + 1
        }
        // adding an event for the event array (6 events)
        let i = Int(arc4random_uniform(4))
        indexN = indexN + i + 1
        event.append(historicalDataArray[indexN][3])
        
        // determining the array of the subsubjects of the main sections
        for sections in historicalSection {
            var descriptionArray: [String] = []
            for historicalData in historicalDataArray {
                if sections == historicalData[0]{
                    if !descriptionArray.contains(historicalData[1]) {
                        descriptionArray.append(historicalData[1])
                    }
                }
            }
            historicalSubjectList.append(descriptionArray)
        }
    }
}

