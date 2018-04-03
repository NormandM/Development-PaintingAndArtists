//
//  CountingLabel.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-03-29.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class CountingLabel: UILabel {
    
    let counterVelocity: Float = 3.0
    
    enum CounterAnimationType{
        case Linear // f(x) = x
        case EaseIn // f(x) = x^3
        case EaseOut // f(x) = (1-x)^^3
    }
    
    enum CounterType {
        case Int
        case Float
    }
    
    var startNumber: Float = 0.0
    var endNumber: Float = 0.0
    
    var progress: TimeInterval!
    var duration: TimeInterval!
    var lastUpdate: TimeInterval!
    
    var timer: Timer?
    
    var counterType: CounterType!
    var counterAnimationType: CounterAnimationType!
    
    var currentCounterValue: Float {
        if progress >= duration {
            return endNumber
        }
        
        let percentage = Float(progress/duration)
        let update = updateCounter(counterValue: percentage)
        return startNumber + (update * (endNumber - startNumber))
    }
    
    func count( fromValue: Float, toValue: Float, withDuration duration: TimeInterval, andAnimationType animationType: CounterAnimationType, andCounterType counterType: CounterType){
        
        self.startNumber = fromValue
        self.endNumber =  toValue
        self.duration = duration
        self.counterType = counterType
        self.counterAnimationType = animationType
        self.progress = 0
        self.lastUpdate = Date.timeIntervalSinceReferenceDate
        
        invalidateTimer()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CountingLabel.upDateValue), userInfo: nil, repeats: true)
        
        if duration == 0 {
            upDateText(value: toValue)
            return
        }
        
    }
    
    @objc func upDateValue () {
       let now =  Date.timeIntervalSinceReferenceDate
        progress = progress +  (now - lastUpdate)
        lastUpdate = now
        
        if progress >= duration {
            invalidateTimer()
            progress = duration
        }
        
        upDateText(value: currentCounterValue)
    }
    
    func upDateText (value: Float){
        switch counterType{
        case .Int:
            self.text = "\(Int(value))"
        case .Float:
            self.text = String(format: "%.2f", value)

        case .none:
            print("none")
        case .some(_):
            print("some")
        }
    }
    func updateCounter (counterValue: Float) -> Float {
        switch counterAnimationType! {
        case .Linear:
            return counterValue
        case .EaseOut:
            return powf(counterValue, counterValue)
        case .EaseIn:
            return 1.0 - powf(1.0 - counterValue, counterVelocity)
            
        }
    }
    
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    
    
    
    

}
