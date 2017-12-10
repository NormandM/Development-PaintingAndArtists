//
//  Animations.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-11-28.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class Animations {
    var label: UILabel
    
    init (label: UILabel) {
        self.label = label
    }
    func growAndShrink() {
        UIView.animate(withDuration: 1, animations: {
            self.label.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.label.transform = CGAffineTransform.identity
            })
        }
    }

    
    
}
