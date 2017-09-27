//
//  ViewController.swift
//  HelperVerbesDict
//
//  Created by Normand Martin on 17-09-26.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var arrayVerbe: [String] = []
var arrN: [String] = []
var arrayFinal = [String]()
var anglaisFrancais = [String: String]()
var arr: NSMutableArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if let plistPath = Bundle.main.path(forResource: "verbesPourDic", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbe = verbArray as! [String]
            print("ok")
        }
        print(arrayVerbe)
        
        for verbe in arrayVerbe {
            anglaisFrancais[verbe] = verbe
        }
        print(anglaisFrancais)
        let anglaisFrancaisIntermediaire = anglaisFrancais as NSDictionary
         let anglaisFrancaisFinal = NSMutableDictionary(dictionary: anglaisFrancaisIntermediaire)
        
//        for array in arrayVerbe{
//            arrN.append(array[0])
//        }
//        print(arrN)
//        for eleme in arrN{
//            if arrayFinal.contains(eleme){
//
//            }else{
//               arrayFinal.append(eleme)
//            }
//        }
//        let arrayFinalNS = arrayFinal as NSArray
//
//        //let plist = Plist(name: "arr5")
////        arrN = (plist?.getValuesInPlistFile())! as! [String]
////
////        print(arrN)
////        for arrays in arr{
////            if arr.contains(arrays){
////
////            }else{
////                arrN.append(arrays as! String)
////            }
////        }
////        print(arrN)
////        print(arrN.count)
//
        if let plist = Plist(name: "FrenchToEnglish"){
            do {
                try plist.addValuesToPlistFile(anglaisFrancaisFinal)
            } catch {
                print(error)
            }
        }else{
            print("unable to get plist")
        }
        
        
        
    }
    
    




}

