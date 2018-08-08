//
//  LabelWithInsets.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-21.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
class SpecialLabel: UILabel {
    var topInset:  CGFloat = 0
    var rightInset:  CGFloat = 5
    var bottomInset:  CGFloat = 0
    var leftInset:  CGFloat = 5
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: self.topInset, left: self.leftInset, bottom: self.bottomInset, right: self.rightInset)
        self.setNeedsLayout()
        return super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
}
