//
//  ViewController.swift
//  HistoricDateQuizV2
//
//  Created by Normand Martin on 17-12-28.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var testString: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let trialString = """
        Find 3 historical events from this period:
        novembre 1949 to november 1949
"""
        testString.text = trialString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

