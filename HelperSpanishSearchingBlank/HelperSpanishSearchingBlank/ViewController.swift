//
//  ViewController.swift
//  HelperSpanishSearchingBlank
//
//  Created by Normand Martin on 17-05-13.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrayVerbe: [[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if let plistPath = Bundle.main.path(forResource: "SpanishVerbs", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbe = verbArray as! [[String]]
        }
        for array in arrayVerbe{
            for verbe in array{
                if verbe == "" {
                    if array[0] == "Imperativo" && array[4] == "" {
                        print(verbe)
                        print(array[0])
                        print(array[1])
                        print(array[2])
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

