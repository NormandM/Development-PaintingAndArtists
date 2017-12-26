//
//  ViewController.swift
//  LinkingItalianPilists
//
//  Created by Normand Martin on 17-05-03.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrayVerbe: [[String]] = []
    var arrayVerbeSup: [[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if let plistPath = Bundle.main.path(forResource: "History1", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbe = verbArray as! [[String]]
        }

        if let plistPath = Bundle.main.path(forResource: "History8", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbeSup = verbArray as! [[String]]
        }
        for verb in arrayVerbeSup{
            arrayVerbe.append(verb )
        }

    
    if let plist = Plist(name: "History1"){
        do {
            try plist.addValuesToPlistFile(arrayVerbe as NSArray)
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

