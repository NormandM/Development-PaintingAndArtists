//
//  ArrayManagement.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-31.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
class ArrayManagement {
    class func manageArray( artistList: [[String]]) -> (String, String, String, String, String, [[String]]){
        let choosingPainterInfo = ChoosingPainterInfo()
        let painterInfo = choosingPainterInfo.selection(artistList: artistList)
        let painterName = painterInfo.0
        let bioDate = painterInfo.1
        let bioText = painterInfo.3
        let firstPainting = painterInfo.2
        let secondPainting = painterInfo.4
        let nameArray = Array(painterName).map{(String($0))}
        let painterNameWithoutBlanck = painterName.replacingOccurrences(of: " ", with: "")
        var shuffledNameArray = Array(painterNameWithoutBlanck).map{(String($0))}
        shuffledNameArray.shuffle()
        let totalNameArray = [nameArray, shuffledNameArray]
        return (painterName, bioDate, firstPainting, bioText, secondPainting, totalNameArray)
    }

}
