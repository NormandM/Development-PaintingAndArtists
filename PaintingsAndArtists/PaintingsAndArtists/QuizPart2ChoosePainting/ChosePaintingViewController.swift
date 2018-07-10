//
//  ChosePaintingViewController.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class ChosePaintingViewController: UIViewController {
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet var messageView: UIView!
    @IBOutlet weak var paintingImage1: UIImageView!
    @IBOutlet weak var paintingImage2: UIImageView!
    @IBOutlet weak var paintingImage3: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    var effect: UIVisualEffect!
    var bioInfoImageName = String()
    var indexPainting = [Int]()
    var artistList = [[String]]()
    var n = Int()
    var partTwoOfQuizDone: Bool = false
    var randomImageNameindex = [Int]()
    var otherPaintingNameForSameArtist = String()
    var imageNameOtherPaintings = [String]()
    var soundPlayer: SoundPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        soundPlayer = SoundPlayer()
        effect = visualEffect.effect
        messageView.layer.cornerRadius = 5
        visualEffect.effect = nil
        let paintingImage: [UIImageView] = [paintingImage1, paintingImage2, paintingImage3]
        infoLabel.textColor = UIColor.white
        infoLabel.text = "Identify another \(artistList[indexPainting[n]][0]) painting"
        let painterName = artistList[indexPainting[n]][0]
        var i = Int()
        otherPaintingNameForSameArtist = String()
        for artistName in artistList {
            if artistName[0] == painterName && i != indexPainting[n] {
                otherPaintingNameForSameArtist = artistName[2]
            }
            i = i + 1
        }
        i = 0
        let tuppleArrayString = PainterSelection.buttonsNameSelection(artistList: artistList, indexPainting: indexPainting, painterButton: nil, n: n)
        imageNameOtherPaintings = tuppleArrayString.0
        imageNameOtherPaintings.append(otherPaintingNameForSameArtist)
        let randomizeOrderOfButtonNames = RandomizeOrderOfButtonNames(buttonNames: imageNameOtherPaintings)
        randomImageNameindex = randomizeOrderOfButtonNames.generateButtonNumerIndex(from: 0, to: 2, quantity: nil)
        imageNameOtherPaintings = [imageNameOtherPaintings[randomImageNameindex[0]], imageNameOtherPaintings[randomImageNameindex[1]], imageNameOtherPaintings[randomImageNameindex[2]]]
        for imageName in imageNameOtherPaintings{
            let image = UIImage(named: imageName)
            paintingImage[i].image = image
            i = i + 1
        }
    }
    @IBAction func doneAction(_ sender: UIButton) {
        animateOut()
    }
    
    @IBAction func imageOneTapped(_ sender: UITapGestureRecognizer) {
        rightImageTapped(imageName: imageNameOtherPaintings[0])
    }
    @IBAction func imageTwoTapped(_ sender: UITapGestureRecognizer) {
         rightImageTapped(imageName: imageNameOtherPaintings[1])
    }
    @IBAction func imageThreeTapped(_ sender: UITapGestureRecognizer) {
         rightImageTapped(imageName: imageNameOtherPaintings[2])
    }
    func rightImageTapped(imageName: String) {
        if imageName == otherPaintingNameForSameArtist {
            print("right answer")
            soundPlayer?.playSound(soundName: "chime_clickbell_octave_up", type: "wav")
            animateIn()
        }else{
            soundPlayer?.playSound(soundName: "etc_error_drum", type: "mp3")
        }
        
    }
    func animateIn () {
        self.view.addSubview(messageView)
        messageView.center = self.view.center
        messageView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        messageView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.visualEffect.effect = self.effect
            self.messageView.alpha = 1
            self.messageView.transform = CGAffineTransform.identity
        }
    }
    func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.messageView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            self.messageView.alpha = 0
            self.visualEffect.effect = nil
        }) { (success: Bool) in
            self.messageView.removeFromSuperview()
            //self.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: {
                return
            })
        }
        performSegue(withIdentifier: "backToViewController", sender: self)
    }
    
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToViewController" {
            
        }
    }
 

}
