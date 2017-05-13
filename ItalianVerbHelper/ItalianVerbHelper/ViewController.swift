//
//  ViewController.swift
//  ItalianVerbQuiz
//
//  Created by Normand Martin on 17-05-02.
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
    var arrayVerbeTransformé : [[String]] = []
    var arrayTransitif: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if let plistPath = Bundle.main.path(forResource: "SpanishVerbs", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbe = verbArray as! [[String]]
        }
        
        for verb in arrayVerbe {
            var arrayTransitif: [String] = []
            if (verb[0] == "indicativo" || verb[0] == "condizionale") && verb[2] != "bisognare"{
                let mode = verb[0].capitalizingFirstLetter()
                let temps = verb[1].capitalizingFirstLetter()
                let infinitf = verb [2]
                arrayTransitif.append(mode)
                arrayTransitif.append(temps)
                arrayTransitif.append(infinitf)
                
                arrayTransitif.append(String(verb[3].characters.dropFirst(3)))
                arrayTransitif.append(String(verb[4].characters.dropFirst(3)))
                arrayTransitif.append(String(verb[5].characters.dropFirst(8)))
                arrayTransitif.append(String(verb[6].characters.dropFirst(4)))
                arrayTransitif.append(String(verb[7].characters.dropFirst(4)))
                arrayTransitif.append(String(verb[8].characters.dropFirst(5)))
                
            }else if verb[0] == "congiuntivo"  && verb[2] != "bisognare"{
                let mode = verb[0].capitalizingFirstLetter()
                let temps = verb[1].capitalizingFirstLetter()
                let infinitf = verb [2]
                arrayTransitif.append(mode)
                arrayTransitif.append(temps)
                arrayTransitif.append(infinitf)
                
                arrayTransitif.append(String(verb[3].characters.dropFirst(7)))
                arrayTransitif.append(String(verb[4].characters.dropFirst(7)))
                arrayTransitif.append(String(verb[5].characters.dropFirst(12)))
                arrayTransitif.append(String(verb[6].characters.dropFirst(8)))
                arrayTransitif.append(String(verb[7].characters.dropFirst(8)))
                arrayTransitif.append(String(verb[8].characters.dropFirst(9)))
                
            }else if verb[0] == "congiuntivo"  && verb[2] == "bisognare"{
                let mode = verb[0].capitalizingFirstLetter()
                let temps = verb[1].capitalizingFirstLetter()
                let infinitf = verb [2]
                arrayTransitif.append(mode)
                arrayTransitif.append(temps)
                arrayTransitif.append(infinitf)
                arrayTransitif.append("")
                arrayTransitif.append("")
                arrayTransitif.append(String(verb[5].characters.dropFirst(4)))
                arrayTransitif.append("")
                arrayTransitif.append("")
                arrayTransitif.append("")

            }else if verb[2] == "bisognare" && verb[0] != "congiuntivo" {
                let mode = verb[0].capitalizingFirstLetter()
                let temps = verb[1].capitalizingFirstLetter()
                let infinitf = verb [2]
                arrayTransitif.append(mode)
                arrayTransitif.append(temps)
                arrayTransitif.append(infinitf)
                arrayTransitif.append("")
                arrayTransitif.append("")
                arrayTransitif.append(verb[5])
                arrayTransitif.append("")
                arrayTransitif.append("")
                arrayTransitif.append("")


    
            
            }else if verb[0] == "imperativo" {
                let mode = verb[0].capitalizingFirstLetter()
                let temps = verb[1].capitalizingFirstLetter()
                let infinitf = verb [2]
                arrayTransitif.append(mode)
                arrayTransitif.append(temps)
                arrayTransitif.append(infinitf)
                arrayTransitif.append("")
                arrayTransitif.append(verb[4])
                arrayTransitif.append(verb[5])
                arrayTransitif.append(verb[6])
                arrayTransitif.append(verb[7])
                arrayTransitif.append(verb[8])

                
            }
            arrayTransitif.append("0")
            arrayTransitif.append("0")
            arrayTransitif.append("0")
            arrayVerbeTransformé.append(arrayTransitif)
        }
        print(arrayVerbeTransformé)
        if let plist = Plist(name: "SpanishVerbs"){
            do {
                try plist.addValuesToPlistFile(arrayVerbeTransformé as NSArray)
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

