//
//  TitleSectionManager.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-12-22.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

class Title {
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    
    func splitString() -> [String] {
        var arrayOfTitles = [String]()
        do {
            var splitted: [String] = []
            var arraySplitted: [[String]] = []
            let items = try fm.contentsOfDirectory(atPath: path)
            for item in items {
                if item.contains("plist") && !item.contains("Info"){
                    let testString = item
                    splitted = testString
                        .splitBefore(separator: { $0.isUpperCase })
                        .map{String($0)}
                    let sliceSplitted = splitted.dropLast()
                    splitted = Array(sliceSplitted)
                    arraySplitted.append(splitted)
                }
            }
            for splitTitle in arraySplitted{
                var fullTitle = String()
                for word in splitTitle {
                    if fullTitle == "" {
                        fullTitle = word
                    }else{
                        fullTitle = fullTitle + " " + word
                    }
                }
                arrayOfTitles.append(fullTitle)
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
        return arrayOfTitles
    }

}
extension Sequence {
    func splitBefore(
        separator isSeparator: (Iterator.Element) throws -> Bool
        ) rethrows -> [AnySequence<Iterator.Element>] {
        var result: [AnySequence<Iterator.Element>] = []
        var subSequence: [Iterator.Element] = []
        
        var iterator = self.makeIterator()
        while let element = iterator.next() {
            if try isSeparator(element) {
                if !subSequence.isEmpty {
                    result.append(AnySequence(subSequence))
                }
                subSequence = [element]
            }
            else {
                subSequence.append(element)
            }
        }
        result.append(AnySequence(subSequence))
        return result
    }
}
extension Character {
    var isUpperCase: Bool { return String(self) == String(self).uppercased() }
}
