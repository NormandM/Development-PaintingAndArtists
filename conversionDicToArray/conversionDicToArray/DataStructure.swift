//
//  DataStructure.swift
//  conversionDicToArray
//
//  Created by Normand Martin on 2017-04-24.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit
struct ListedeVerbe {
    
    let infinitif: [String]
    let tempsVerbe: [String]
    let personneVerbe: [String]
    let dictVerbes: [String: [String:[String: String]]]
    
    init(verbeDictionary: [String: [String: AnyObject]]) {
        dictVerbes = verbeDictionary["verbe"] as! [String: [String:[String: String]]]
        
        infinitif = (verbeDictionary["verbe"] as AnyObject).allKeys as! [String]
        
        tempsVerbe = (verbeDictionary["verbe"]?["essere"] as AnyObject).allKeys as! [String]
        
        personneVerbe = (verbeDictionary["verbe"]?["essere"]?["Indicativo Futuro semplice"] as AnyObject).allKeys as! [String]
        
    }
    
}
