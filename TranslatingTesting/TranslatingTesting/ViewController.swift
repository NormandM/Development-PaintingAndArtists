//
//  ViewController.swift
//  TranslatingTesting
//
//  Created by Normand Martin on 17-09-01.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func animate(_ sender: Any) {
        let label1Frame  = label1.frame
        let label2Frame = label2.frame
        let maxXLabel1 = label1Frame.maxX
        let maxYLabel1 = label1Frame.maxY
        let maxXLabel2 = label2Frame.maxX
        print(maxXLabel2)
        let maxYLabel2 = label2Frame.maxY
        UIView.animate(withDuration: 2, animations: {
            self.label1.transform = CGAffineTransform(translationX: 0, y: maxYLabel2 - maxYLabel1)
        })
        
    }
    


}

