//
//  OtherPainting.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-16.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class OtherPaintings {
    class func choose(artistList: [[String]], otherPaintingNameForSameArtist: String, bioInfoImageName: String) -> [String]{
        var otherPaintingsChosen = [String]()
        var allPaintings = [String]()
        for paintings in artistList {
            if paintings[2] != otherPaintingNameForSameArtist && paintings[2] != bioInfoImageName {
                allPaintings.append(paintings[2])
            }
        }
        let  chooseRandomlyPaintingsName = RandomizeOrderOfArray(listNames: allPaintings)
        let randomIndex = chooseRandomlyPaintingsName.generateRandomIndex(from: 0, to: allPaintings.count - 1, quantity: 2)
        otherPaintingsChosen = [allPaintings[randomIndex[0]], allPaintings[randomIndex[1]]]
        return otherPaintingsChosen
    }
}
