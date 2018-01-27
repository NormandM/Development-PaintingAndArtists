//
//  TestViewController.swift
//  VisualTrials
//
//  Created by Normand Martin on 18-01-15.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var myTypeWriter: UITextField!
    let myText = Array("Hello World !!!")
    var myCounter = 0
    var timer:Timer?
    func fireTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(typeLetter), userInfo: nil, repeats: true)
    }
    @objc func typeLetter(){
        if myCounter < myText.count {
            myTypeWriter.text = myTypeWriter.text! + String(myText[myCounter])
            let randomInterval = Double((arc4random_uniform(4)+1))/20
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: randomInterval, target: self, selector:  #selector(typeLetter), userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
        }
        myCounter += 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fireTimer()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
