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
    @IBOutlet weak var commentAfterResponse: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var quizProgressBar: UIProgressView!
    
    @IBOutlet weak var responseRatio: UILabel!
    var successiveRightAnswers =  UserDefaults.standard.integer(forKey: "successiveRightAnswers")

    var effect: UIVisualEffect!
    var bioInfoImageName = String()
    var indexPainting = [Int]()
    var artistList = [[String]]()
    var n = Int()
    var partTwoOfQuizDone: Bool = false
    var randomImageNameindex = [Int]()
    var otherPaintingNameForSameArtist = String()
    var imageNameOtherPaintings = [String]()
    var totalQuestion = Int()
    var soundPlayer: SoundPlayer?
    var painterName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        soundPlayer = SoundPlayer()
        effect = visualEffect.effect
        messageView.layer.cornerRadius = 5
        visualEffect.effect = nil
        let paintingImage: [UIImageView] = [paintingImage1, paintingImage2, paintingImage3]
        infoLabel.textColor = UIColor.white
        infoLabel.text = "Identify another \(artistList[indexPainting[n]][0]) painting"
        painterName = artistList[indexPainting[n]][0]
        var i = Int()
        otherPaintingNameForSameArtist = String()
        for artistName in artistList {
            if artistName[0] == painterName && i != indexPainting[n] {
                otherPaintingNameForSameArtist = artistName[2]
            }
            i = i + 1
        }
        i = 0
        imageNameOtherPaintings = OtherPaintings.choose(artistList: artistList, indexPainting: indexPainting, n: n)
        imageNameOtherPaintings.append(otherPaintingNameForSameArtist)
        print("imageNameOtherPaintings: \(imageNameOtherPaintings)")
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
        MessageView.dismissMessageview(messageView: messageView, visualEffect: visualEffect, effect: effect)
        performSegue(withIdentifier: "backToViewController", sender: self)

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
            CreditManagment.increaseOneCredit(hintButton: nil)
            soundPlayer?.playSound(soundName: "chime_clickbell_octave_up", type: "wav")
            let tuppleResponse = SuccessiveAnswer.progression(commentAfterResponse: commentAfterResponse, painterName: painterName)
            commentAfterResponse = tuppleResponse.0
            totalQuestion = tuppleResponse.1
            successiveRightAnswers = UserDefaults.standard.integer(forKey: "successiveRightAnswers") + 1

//            if successiveRightAnswers == 5 {
//                commentAfterResponse.text = """
//                Art Expert!
//                You had 5 consecutives right answers
//                5 coin bonnus was added to your credits
//                """
//                CreditManagment.increaseFiveCredit()
//                UserDefaults.standard.set(0, forKey: "successiveRightAnswers")
//                QuizProgressionBar.barDisplay(successiveRightAnswers: successiveRightAnswers, quizProgressionBar: quizProgressBar)
//            }else{
//                commentAfterResponse.text = """
//                Great!
//                You recognized
//                \(painterName)'s style.
//                1 coin bonnus was added to your credits
//                """
//
//            }
            MessageView.showMessageView(view: view, messageView: messageView, button: okButton, visualEffect: visualEffect, effect: effect)

            UserDefaults.standard.set(successiveRightAnswers, forKey: "successiveRightAnswers")

        }else{
            soundPlayer?.playSound(soundName: "etc_error_drum", type: "mp3")
            commentAfterResponse.text = "Sorry! It is not the right answer"
            MessageView.showMessageView(view: view, messageView: messageView, button: okButton, visualEffect: visualEffect, effect: effect)
            UserDefaults.standard.set(0, forKey: "successiveRightAnswers")
        }
        successiveRightAnswers = UserDefaults.standard.integer(forKey: "successiveRightAnswers")
        QuizProgressionBar.barDisplay(successiveRightAnswers: successiveRightAnswers, quizProgressionBar: quizProgressBar, totalQuestion: totalQuestion)
        responseRatio.text = "\(successiveRightAnswers)/\(totalQuestion)"

    }

    
    

    
    // MARK: - Navigation

 

}
