//
//  ViewController.swift
//  conversionDicToArray
//
//  Created by Normand Martin on 2017-04-24.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var infinitif: [String] = []
    var tempsVerbe: [String] = []
    var personneVerbe: [String] = []
    var dictVerbes: [String: [String:[String: String]]] = ["": ["":["": ""]]]
    var goodResponse: String = ""
    var tempsTest: String = ""
    var verbArray: [[String]] = []
    var listeDeVerbe: [String : [String : AnyObject]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        if let plistPath = Bundle.main.path(forResource: "ItalianVerbPlist", ofType: "plist"),
            let verbeDictionary = NSDictionary(contentsOfFile: plistPath){
            let listeDeVerbe = ListedeVerbe(verbeDictionary: verbeDictionary as! [String : [String : AnyObject]])
            dictVerbes = listeDeVerbe.dictVerbes
            infinitif = listeDeVerbe.infinitif
            tempsVerbe = listeDeVerbe.tempsVerbe
            personneVerbe = listeDeVerbe.personneVerbe
        }
        
        //print(dictVerbes)
        //print(infinitif)
        //print(tempsVerbe)
        //print(personneVerbe)
        let countTemps = tempsVerbe.count
        let countInfinitif = infinitif.count
        var n = 0
        print(countTemps)
        var temps01: String = ""
        var temps02: String = ""
        var temps03: String = ""
        var temps04: String = ""
        var temps05: String = ""
        var temps06: String = ""
        for temps in tempsVerbe{
                if temps == tempsVerbe[n] {
                    for infintifs in infinitif {
                        if let temp = dictVerbes[infintifs]?[temps]?["io"] {
                            temps01 = temp
                        }else {temps01 = ""}
                        if let temp = dictVerbes[infintifs]?[temps]?["tu"] {
                            temps02 = temp
                        }else {temps02 = ""}

                        if let temp = dictVerbes[infintifs]?[temps]?["lui, lei"] {
                            temps03 = temp
                        }else {temps03 = ""}

                        if let temp = dictVerbes[infintifs]?[temps]?["noi"] {
                            temps04 = temp
                        }else {temps04 = ""}

                        if let temp = dictVerbes[infintifs]?[temps]?["voi"] {
                            temps05 = temp
                        }else {temps05 = ""}

                        if let temp = dictVerbes[infintifs]?[temps]?["loro"] {
                            temps06 = temp
                        }else {temps06 = ""}

                        let essai = [temps, infintifs, temps01, temps02, temps03, temps04, temps05, temps06]
                        verbArray.append(essai)
                    }

            }
            n = n + 1
        }
        n = 0
        var verbTrans : [String] = []
        for verb in verbArray{
            let fullNameArr = verb[0].characters.split{$0 == " "}.map(String.init)
            let mode = fullNameArr[0]
            var tempsSeul: String = ""
            var i = 1
            while i < fullNameArr.count {
                if tempsSeul == "" {
                    tempsSeul = fullNameArr[i]
                }else{ tempsSeul = tempsSeul + " " + fullNameArr[i]}
                i = i + 1
            }
            verbTrans = []
            verbTrans.append(mode)
            verbTrans.append(tempsSeul)
            verbTrans.append(verb[1])
            verbTrans.append(verb[2])
            verbTrans.append(verb[3])
            verbTrans.append(verb[4])
            verbTrans.append(verb[5])
            verbTrans.append(verb[6])
            verbTrans.append(verb[7])
            verbTrans.append("0")
            verbTrans.append("0")
            verbTrans.append("0")
            
            verbArray[n] = verbTrans
            //print(verbArray[n])
            n = n + 1
        }
        n = 0
        for verb in verbArray{
            
            if verb[0] == "Indicativo" && verb[1] == "Presente" && verb [2] == "cuocere" {
                print(verb[2])
                print(verb[3])
                n = n + 1
            }
        }
        print(n)
        if let plist = Plist(name: "arr5"){
            do {
                try plist.addValuesToPlistFile(verbArray as NSArray)
                
            } catch {
                print(error)
            }
        }else{
            print("unable to get plist")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

