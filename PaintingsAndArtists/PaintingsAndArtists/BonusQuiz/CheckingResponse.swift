//
//  CheckingResponse.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-08-05.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import Foundation
class CheckingReponse {
    class func goodOrBad(indexResponse: [(Int, String)], painterName: [String]) -> Bool {
        var arrayResponse = [String]()
        var isResponseGood = Bool ()
        for response in indexResponse {
            arrayResponse.append(response.1)
        }
        if arrayResponse == painterName {
            isResponseGood = true
        }else{
            false
        }
        return isResponseGood
    }
    
}
