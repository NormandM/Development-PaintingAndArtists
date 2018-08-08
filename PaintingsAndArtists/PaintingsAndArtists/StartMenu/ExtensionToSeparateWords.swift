//
//  ExtensionToSeparateWords.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-28.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
extension String {
    var wordList: [String] {
        return components(separatedBy: .punctuationCharacters)
            .joined()
            .components(separatedBy: .whitespaces)
    }
}
