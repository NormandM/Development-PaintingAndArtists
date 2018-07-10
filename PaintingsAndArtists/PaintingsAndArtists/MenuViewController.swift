//
//  MenuViewController.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-05-23.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var artistList: [[String]] = []
    var artistsCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        if let plistPath = Bundle.main.path(forResource: "ArtistesAndPaintings", ofType: "plist"),
            let artistListNSArray = NSArray(contentsOfFile: plistPath){
            artistList = artistListNSArray as! [[String]]
            artistsCount = artistList.count
        }
///////// Sorting Array by Surname //////////////////
        var listOfArtistName: [String] = []
        var listOfArtistSurname: [String] = []
        var sortedArtistList: [[String]] = []
        for artist in artistList{
            listOfArtistName.append(artist[0])
        }
        for surname in listOfArtistName{
            listOfArtistSurname.append(surname.lastWord)
        }
        func alpha (_ s1: String, s2: String) -> Bool {
            return s1 < s2
        }
        listOfArtistSurname = listOfArtistSurname.sorted(by: alpha)

        for surname in listOfArtistSurname {
            for artist in artistList {
                if artist[0].contains(surname) && !sortedArtistList.contains(artist){
                    sortedArtistList.append(artist)
                }
            }
        }
        artistList = sortedArtistList
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = UIColor.white
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSlideShowViewController" {
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            backItem.tintColor = UIColor.white
            let controller = segue.destination as! SlideShowViewController
            controller.artistList = artistList
            controller.artistsCount = artistsCount
        }
        if segue.identifier == "showInfoAndImageViewController"{
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            backItem.tintColor = UIColor.white
            let controller = segue.destination as! infoAndImageViewController
            controller.artistList = artistList
            controller.artistsCount = artistsCount
        }
        if segue.identifier == "showViewController"{
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            backItem.tintColor = UIColor.white
            let controller = segue.destination as! ViewController
            controller.artistList = artistList
            controller.artistsCount = artistsCount
        }
        
    }
 

}
extension String {
    var byWords: [String] {
        var byWords:[String] = []
        enumerateSubstrings(in: startIndex..<endIndex, options: .byWords) {
            guard let word = $0 else { return }
            print($1,$2,$3)
            byWords.append(word)
        }
        return byWords
    }
    func firstWords(_ max: Int) -> [String] {
        return Array(byWords.prefix(max))
    }
    var firstWord: String {
        return byWords.first ?? ""
    }
    func lastWords(_ max: Int) -> [String] {
        return Array(byWords.suffix(max))
    }
    var lastWord: String {
        return byWords.last ?? ""
    }
}
