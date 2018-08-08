//
//  PainterSelection.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
class PainterSelection {
    class func buttonsNameSelection(artistList: [[String]], indexPainting: [Int], painterButton: [UIButton], selectedIndex: Int) -> [String]{
        var otherPainters = [String]()
        var chosenOtherPaintersIndex = [Int]()
        var i = 0
        for artist in artistList {
            if artist[0] != artistList[indexPainting[selectedIndex]][0] && !otherPainters.contains(artist[0]) {
                otherPainters.append(artist[0])
            }
            
        }
        let otherPaintersCount = otherPainters.count
        i = 0
        while chosenOtherPaintersIndex.count < 3 {
            let newIndexPainter = Int(arc4random_uniform(UInt32(otherPaintersCount)))
            if !chosenOtherPaintersIndex.contains(newIndexPainter){
                chosenOtherPaintersIndex.append(newIndexPainter)
            }
            i = i + 1
        }
        let painterNamesForQuiz = [artistList[indexPainting[selectedIndex]][0], otherPainters[chosenOtherPaintersIndex[0]], otherPainters[chosenOtherPaintersIndex[1]] ,otherPainters[chosenOtherPaintersIndex[2]]]
        let randomizeOrderOfButtonNames = RandomizeOrderOfArray(listNames: painterNamesForQuiz)
        let indexOrderForButtonNames = randomizeOrderOfButtonNames.generateRandomIndex(from: 0, to: painterNamesForQuiz.count - 1, quantity: nil)
        let finalArrayOfButtonNames = [painterNamesForQuiz[indexOrderForButtonNames[0]], painterNamesForQuiz[indexOrderForButtonNames[1]], painterNamesForQuiz[indexOrderForButtonNames[2]], painterNamesForQuiz[indexOrderForButtonNames[3]]]
        LabelAndButton.buttonVisible(painterButton: painterButton, finalArrayOfButtonNames: finalArrayOfButtonNames)
        return finalArrayOfButtonNames
    }
}
