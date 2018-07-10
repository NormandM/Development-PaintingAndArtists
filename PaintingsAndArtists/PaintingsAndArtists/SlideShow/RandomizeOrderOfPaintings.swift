//
//  RandomizeOrderOfPaintings.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-06-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

struct RandomizeOrderOfPaintings {
    var artistList: [[String]]
    func generatePaintingIndex(from: Int, to: Int, quantity: Int?) -> [Int] {
        var numberOfNumbers = quantity
        var randomNumbers: [Int] = []
        let lower = UInt32(from)
        let higher = UInt32(to+1)
        if numberOfNumbers == nil || numberOfNumbers! > (to - from) + 1 {
            numberOfNumbers = (to - from) + 1
        }
        while randomNumbers.count != numberOfNumbers {
            let numbers = arc4random_uniform(higher - lower) + lower
            if !randomNumbers.contains(Int(numbers)){
                randomNumbers.append(Int(numbers))
            }
        }
        return randomNumbers
    }
}
struct RandomizeOrderOfButtonNames {
    var buttonNames: [String]
    func generateButtonNumerIndex(from: Int, to: Int, quantity: Int?) -> [Int] {
        var numberOfNumbers = quantity
        var randomNumbers: [Int] = []
        let lower = UInt32(from)
        let higher = UInt32(to+1)
        if numberOfNumbers == nil || numberOfNumbers! > (to - from) + 1 {
            numberOfNumbers = (to - from) + 1
        }
        while randomNumbers.count != numberOfNumbers {
            let numbers = arc4random_uniform(higher - lower) + lower
            if !randomNumbers.contains(Int(numbers)){
                randomNumbers.append(Int(numbers))
            }
        }
        return randomNumbers
    }
    
}
