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
    var effect: UIVisualEffect!
    @IBOutlet var menuView: UIView!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet weak var grandeJatte: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        effect = visualEffect.effect
        menuView.layer.cornerRadius = 5
        visualEffect.effect = nil
        UserDefaults.standard.set(0, forKey: "cycleCount")
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
            listOfArtistSurname.append(surname.wordList.last!)
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
    
        let appDelegate = AppDelegate()
        let orientation = appDelegate.rotated()
        if orientation {
            ImageManager.choosImage(imageView: grandeJatte, imageName: "Un dimanche après-midi à l'île de la Grande Jatte")
        }else{
            ImageManager.choosImage(imageView: grandeJatte, imageName: "detailDeaGrandeJatte")

        }
        artistList = sortedArtistList
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            MessageView.showMessageView(view: self.view, messageView: self.menuView, button: nil, visualEffect: self.visualEffect, effect: self.effect, diplomaImageView: nil, totalPaintings: nil)
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
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


