//
//  ViewController.swift
//  SpanishVerbHelper
//
//  Created by Normand Martin on 17-05-08.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit
extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}


class ViewController: UIViewController {
    var arrayVerbe: [[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        if let plistPath = Bundle.main.path(forResource: "arr5", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbe = verbArray as! [[String]]
        }
        var counter = 0
        for _ in arrayVerbe{
            swap(&arrayVerbe[counter][1], &arrayVerbe[counter][3])
            swap(&arrayVerbe[counter][1], &arrayVerbe[counter][2])
            arrayVerbe[counter].remove(at: 0)
            
            if arrayVerbe[counter][0].contains("Subjuntivo")  {
                
                if let range = arrayVerbe[counter][1].range(of: "Subjuntivo ") {
                    arrayVerbe[counter][1].removeSubrange(range)
                    let cap = arrayVerbe[counter][1].capitalizingFirstLetter()
                    arrayVerbe[counter][1] = cap
                    
               }
 
               
            }
            counter = counter + 1
            print(counter)
        }
        print(arrayVerbe)
        if let plist = Plist(name: "arr5"){
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

