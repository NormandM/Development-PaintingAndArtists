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

       // print(arrayVerbe)
        
//        for verbe in arrayVerbe {
//            anglaisFrancais[verbe] = verbe
//        }
//        print(anglaisFrancais)
//        let anglaisFrancaisIntermediaire = anglaisFrancais as NSDictionary
//         let anglaisFrancaisFinal = NSMutableDictionary(dictionary: anglaisFrancaisIntermediaire)
/////////////////////////////////////////////////////////////////////////////
        ////////Getting a Plist of the verbs in array form
//        if let plistPath = Bundle.main.path(forResource: "ItalianVerbsList", ofType: "plist"),
//            let verbArray = NSArray(contentsOfFile: plistPath){
//            arrayVerbe = verbArray as! [[String]]
//            print("ok")
//        }
//        for array in arrayVerbe{
//            arrN.append(array[2])
//        }
//        for eleme in arrN{
//            if arrayFinal.contains(eleme){
//
//            }else{
//               arrayFinal.append(eleme)
//            }
//        }
//        print(arrayFinal)
//        let arrayFinalNS = arrayFinal as NSArray
//        if let plist = Plist(name: "FrenchToEnglish"){
//            do {
//                try plist.addValuesToPlistFile(arrayFinalNS)
//            } catch {
//                print(error)
//            }
//        }else{
//            print("unable to get plist")
//        }
//////////////////////////////////////////////////////////////////////////////
        if let plistPath = Bundle.main.path(forResource: "VerbPourDic", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbe = verbArray as! [String]
            print("ok")
        }


        print(arrayVerbe)
        var dicTranslate = [String: String]()
        for verbe in arrayVerbe {
            dicTranslate[verbe] = "english"
        }
        print(dicTranslate)
        if let plist = Plist(name: "FrenchToEnglish"){
            let dict = plist.getMutablePlistFile()!
            do {
                try plist.addValuesToPlistFile(dicTranslate as! NSDictionary)
            } catch {
                print(error)
            }
        }

    }
 
}



