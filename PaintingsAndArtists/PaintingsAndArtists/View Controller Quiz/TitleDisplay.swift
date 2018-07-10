//
//  TitleDisplay.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-03.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class TitleDisplay {
    class func show(labelTitle: UILabel, titleText: String, nextButton: UIButton, view: ViewController) {
        let fontsAndConstraints = FontsAndConstraints()
        labelTitle.backgroundColor = .clear
        labelTitle.numberOfLines = 2
        labelTitle.font = fontsAndConstraints.size().2
        labelTitle.textAlignment = .center
        labelTitle.textColor = .white
        view.navigationItem.titleView = labelTitle
        labelTitle.text = titleText
        //labelTitle.text = artistList[indexPainting[n]][2]
        nextButton.isEnabled = true
        nextButton.isHidden = false
    }
}
