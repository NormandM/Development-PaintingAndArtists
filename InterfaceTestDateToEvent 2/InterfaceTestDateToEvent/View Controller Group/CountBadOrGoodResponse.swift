//
//  CountBadOrGoodResponse.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-02-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class CountGoodOrBadResponse{
    class func countBadResponse(button: SpecialButton){
        var singleEventDescription = String()
        if let tempEventDescription = button.titleLabel?.text{
            singleEventDescription = tempEventDescription
        }
        let eventElement = CodeDataHandler.filterData(searchFor: singleEventDescription, inAttribute: "eventDescription")
        if let tempElement = eventElement {
            let singleElement = tempElement[0]
            singleElement.badResponse = singleElement.badResponse + 1
            if !CodeDataHandler.saveSingleObject(event: singleElement){
                print("nothing was saved")
            }
        }
    }
    class func countGoodResponse(button: SpecialButton){
        var singleEventDescription = String()
        if let tempEventDescription = button.titleLabel?.text{
            singleEventDescription = tempEventDescription
        }
        let eventElement = CodeDataHandler.filterData(searchFor: singleEventDescription, inAttribute: "eventDescription")
        if let tempElement = eventElement {
            let singleElement = tempElement[0]
            singleElement.goodResponse = singleElement.goodResponse + 1
            if !CodeDataHandler.saveSingleObject(event: singleElement){
                print("nothing was saved")
            }
        }
    }
    class func sumOfBadResponses(selectedTitle: String) -> Int{
        var sumBadResponse = Int()
        
        if let tempEvents = CodeDataHandler.filterData(searchFor: selectedTitle, inAttribute: "selectedTitle"){
            let events = tempEvents
            sumBadResponse = Int(events.reduce(0) { $0 + ($1.value(forKey: "badResponse") as? Int16 ?? 0) })
        }
        return sumBadResponse
    }
    class func sumOfGoodResponse(selectedTitle: String) -> Int {
        var sumGoodResponse = Int()
        if let tempEvents = CodeDataHandler.filterData(searchFor: selectedTitle, inAttribute: "selectedTitle"){
            let events = tempEvents
            sumGoodResponse = Int(events.reduce(0) { $0 + ($1.value(forKey: "goodResponse") as? Int16 ?? 0) })
        }
        return sumGoodResponse
    }
}
