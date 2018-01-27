//
//  ViewController.swift
//  CircularAnimation
//
//  Created by Normand Martin on 18-01-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testLabel2: UILabel!
    var circlePath = UIBezierPath()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        circlePath = UIBezierPath(arcCenter: view.center, radius: 80, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 4
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.actionTimer), userInfo: nil, repeats: false)
        //let squareView = UIView()
        //whatever the value of origin for squareView will not affect the animation
        //squareView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //squareView.backgroundColor = .lightGray
        //view.addSubview(squareView)
        // You can also pass any unique string value for key
        //squareView.layer.add(animation, forKey: nil)
        testLabel.layer.add(animation, forKey: nil)
        testLabel2.layer.add(animation, forKey: nil)
        // circleLayer is only used to locate the circle animation path
       // let circleLayer = CAShapeLayer()
       // circleLayer.path = circlePath.cgPath
       // circleLayer.strokeColor = UIColor.white.cgColor
       // circleLayer.fillColor = UIColor.clear.cgColor
       // view.layer.addSublayer(circleLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func actionTimer() {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 4
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        testLabel2.layer.add(animation, forKey: nil)
    }


}

