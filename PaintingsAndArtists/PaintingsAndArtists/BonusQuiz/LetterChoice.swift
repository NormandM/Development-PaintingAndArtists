//
//  LetterChoice.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-08-04.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import Foundation
class LetterChoice {
    class func indexLetter(painterName: [String], shuffledPainterName: [String]) -> ([(Int, String)], [(Int, String)]){
        var n = 0
        var indexPainterName = [(Int, String)]()
        var indexShuffledPainterName = [(Int, String)]()
        for name in painterName {
            if name != " " {
                indexPainterName.append((n, "__"))
            }else{
                indexPainterName.append((n, " "))
            }
            
            n = n + 1
        }
        n = 0
        for letter in shuffledPainterName {
            indexShuffledPainterName.append((n, letter))
            n = n + 1
        }
        return (indexPainterName, indexShuffledPainterName)
    }
}
