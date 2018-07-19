//
//  OtherPainting.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-16.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class OtherPaintings {
    class func choose(artistList: [[String]], indexPainting: [Int], n: Int) -> [String]{
        var otherArtists = artistList
        var otherPaintingsChosen = [String]()
        var chosenOtherPaintingIndex = [Int]()
        var i = 0
        for artist in artistList {
            if artistList[indexPainting[n]][0] == artist[0]{
                otherArtists.remove(at: i)
                i = i - 1
            }
            i = i + 1
        }
        let countOfArtists = otherArtists.count
        while chosenOtherPaintingIndex.count < 2 {
            let newIndexPainting = Int(arc4random_uniform(UInt32(countOfArtists)))
            if !chosenOtherPaintingIndex.contains(newIndexPainting){
                chosenOtherPaintingIndex.append(newIndexPainting)
            }
            i = i + 1
        }
        otherPaintingsChosen = [artistList[chosenOtherPaintingIndex[0]][2], artistList[chosenOtherPaintingIndex[1]][2]]
        return otherPaintingsChosen
    }
}
