//
//  ViewController.swift
//  CountingStringLenghtForQuiz
//
//  Created by Normand Martin on 18-02-09.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var historicalDataArray: [[String]] = []
        if let plistPath = Bundle.main.path(forResource: "AncientCivilisation", ofType: "plist"), let historicalNSArray = NSArray(contentsOfFile: plistPath){
            historicalDataArray = historicalNSArray as! [[String]]
        }
        var n = 0
        for array in historicalDataArray{
            if array[3].count > 94 {
                print(n)
                print("string count \(array[3].count)")
            }
            n = n + 1
        }
    }



}

