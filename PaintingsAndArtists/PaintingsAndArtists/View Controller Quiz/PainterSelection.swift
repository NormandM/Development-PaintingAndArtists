//
//  PainterSelection.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
class PainterSelection {
    class func buttonsNameSelection(artistList: [[String]], indexPainting: [Int], painterButton: [UIButton]?, n: Int) -> ([String], [String]){

        var otherPainters = artistList
        var chosenOtherPaintersIndex = [Int]()
        var chosenOtherPaintersName = [String]()
        var i = 0
        for artist in artistList {
            if artist[0] == artistList[indexPainting[n]][0] {
                otherPainters.remove(at: i)
                i = i - 1
            }
            i = i + 1
        }
        let otherPaintersCount = otherPainters.count
        i = 0
        while chosenOtherPaintersIndex.count < 3 {
            let newIndexPainter = Int(arc4random_uniform(UInt32(otherPaintersCount)))
            if !chosenOtherPaintersIndex.contains(newIndexPainter) && !chosenOtherPaintersName.contains(otherPainters[i][0]){
                chosenOtherPaintersName.append(otherPainters[i][0])
                chosenOtherPaintersIndex.append(newIndexPainter)
            }
            i = i + 1
        }
        let painterNamesForQuiz = [artistList[indexPainting[n]][0], otherPainters[chosenOtherPaintersIndex[0]][0], otherPainters[chosenOtherPaintersIndex[1]][0],otherPainters[chosenOtherPaintersIndex[2]][0]]
        let randomizeOrderOfButtonNames = RandomizeOrderOfButtonNames(buttonNames: painterNamesForQuiz)
        let indexOrderForButtonNames = randomizeOrderOfButtonNames.generateButtonNumerIndex(from: 0, to: painterNamesForQuiz.count - 1, quantity: nil)
        print(painterNamesForQuiz)
        print(indexOrderForButtonNames)
        let finalArrayOfButtonNames = [painterNamesForQuiz[indexOrderForButtonNames[0]], painterNamesForQuiz[indexOrderForButtonNames[1]], painterNamesForQuiz[indexOrderForButtonNames[2]], painterNamesForQuiz[indexOrderForButtonNames[3]]]
        if let painterButtons = painterButton {
            LabelAndButton.buttonVisible(painterButton: painterButtons, finalArrayOfButtonNames: finalArrayOfButtonNames)
        }


//        labelTitle.text = ""
//        errorCounter = 0
//        errorMessage.text = ""
        
//        let imageName = artistList[indexPainting[n]][2]
//        let image = UIImage(named: imageName)
//        paintingImage.image = image
        return ([otherPainters[chosenOtherPaintersIndex[0]][2], otherPainters[chosenOtherPaintersIndex[1]][2]], finalArrayOfButtonNames)
    }
}
