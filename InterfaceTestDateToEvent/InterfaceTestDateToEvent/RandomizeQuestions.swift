//
//  RandomizeQuestions.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-11-24.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
struct RandomizeQuestion {
    let date: [String]
    let event: [String]
    func generateDateIndex(from: Int, to: Int, quantity: Int?) -> [Int] {
        var numberOfNumbers = quantity
        var randomNumbers: [Int] = []
        let lower = UInt32(from)
        let higher = UInt32(to+1)
        if numberOfNumbers == nil || numberOfNumbers! > (to - from) + 1 {
            numberOfNumbers = (to - from) + 1
        }
        while randomNumbers.count != numberOfNumbers {
            let numbers = arc4random_uniform(higher - lower) + lower
            if !randomNumbers.contains(Int(numbers)) {
                randomNumbers.append(Int(numbers))
            }
        }
        return randomNumbers
    }
    func generateEventIndex(from: Int, to: Int, quantity: Int?) -> [Int] {
        var numberOfNumbers = quantity
        var randomNumbers: [Int] = []
        let lower = UInt32(from)
        let higher = UInt32(to+1)
        if numberOfNumbers == nil || numberOfNumbers! > (to - from) + 1 {
            numberOfNumbers = (to - from) + 1
        }
        while randomNumbers.count != numberOfNumbers {
            let numbers = arc4random_uniform(higher - lower) + lower
            if !randomNumbers.contains(Int(numbers)) {
                randomNumbers.append(Int(numbers))
            }
        }
        return randomNumbers
    }
    
}
