//
//  ChosePaintingViewController.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class ChosePaintingViewController: UIViewController {
    //@IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet var messageView: UIView!
    @IBOutlet var specialMessageView: UIView!
    @IBOutlet weak var paintingImage1: UIImageView!
    @IBOutlet weak var paintingImage2: UIImageView!
    @IBOutlet weak var paintingImage3: UIImageView!
    @IBOutlet weak var diplomaImageView: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var commentAfterResponse: SpecialLabel?
    @IBOutlet weak var specialCommentAfterResponse: SpecialLabel!
    @IBOutlet weak var commentOnResponse: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var specialViewOkButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var quizProgressBar: UIProgressView!
    
    @IBOutlet weak var responseRatio: UILabel!
    var successiveRightAnswers =  UserDefaults.standard.integer(forKey: "successiveRightAnswers")

    //var effect: UIVisualEffect!
    var bioInfoImageName = String()
    var indexPainting = [Int]()
    var artistList = [[String]]()
    var selectedIndex = Int()
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
       // effect = visualEffect.effect
       // messageView.layer.cornerRadius = 5
       // specialMessageView.layer.cornerRadius = 5
       // visualEffect.effect = nil
        commentOnResponse.isHidden = true
        let paintingImage: [UIImageView] = [paintingImage1, paintingImage2, paintingImage3]
        infoLabel.textColor = UIColor.white
        infoLabel.text = "Identify another \(artistList[indexPainting[selectedIndex]][0]) painting"
        painterName = artistList[indexPainting[selectedIndex]][0]
        var i = Int()
        for artistName in artistList {
            if artistName[0] == painterName && i != indexPainting[selectedIndex] {
                otherPaintingNameForSameArtist = artistName[2]
            }
            i = i + 1
        }
        i = 0
        imageNameOtherPaintings = OtherPaintings.choose(artistList: artistList, otherPaintingNameForSameArtist: otherPaintingNameForSameArtist, bioInfoImageName: bioInfoImageName)
        imageNameOtherPaintings.append(otherPaintingNameForSameArtist)
        let randomizeOrderOfButtonNames = RandomizeOrderOfArray(listNames: imageNameOtherPaintings)
        randomImageNameindex = randomizeOrderOfButtonNames.generateRandomIndex(from: 0, to: 2, quantity: nil)
        imageNameOtherPaintings = [imageNameOtherPaintings[randomImageNameindex[0]], imageNameOtherPaintings[randomImageNameindex[1]], imageNameOtherPaintings[randomImageNameindex[2]]]
        
        for imageName in imageNameOtherPaintings{
            ImageManager.choosImage(imageView: paintingImage[i], imageName: imageName)
            i = i + 1
        }
        UserDefaults.standard.set(selectedIndex + 1, forKey: "selectedIndex")
    }
    override func viewDidAppear(_ animated: Bool) {
        nextButton.layer.masksToBounds = true
        nextButton.layer.cornerRadius = nextButton.frame.width/2
        nextButton.backgroundColor = UIColor(displayP3Red: 27/255, green: 95/255, blue: 94/255, alpha: 1.0)
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        //MessageView.dismissMessageview(messageView: messageView, visualEffect: visualEffect, effect: effect)

    }
    @IBAction func nextButtonWasPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showBonusQuiz", sender: self)
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
        let totalPaintings = artistList.count
        if imageNameOtherPaintings[0] != otherPaintingNameForSameArtist {paintingImage1.isHidden = true}
        if imageNameOtherPaintings[1] != otherPaintingNameForSameArtist {paintingImage2.isHidden = true}
        if imageNameOtherPaintings[2] != otherPaintingNameForSameArtist {paintingImage3.isHidden = true}
        commentOnResponse.isHidden = false

        if imageName == otherPaintingNameForSameArtist {

            commentOnResponse.text = """
            Great!
            You recognized
            \(painterName)'s style.
            """
            CreditManagment.increaseOneCredit(hintButton: nil)
            soundPlayer?.playSound(soundName: "chime_clickbell_octave_up", type: "wav")
            let tuppleResponse = SuccessiveAnswer.progression(commentAfterResponse: commentAfterResponse!, painterName: painterName, totalPaintings: totalPaintings)
            totalQuestion = tuppleResponse.1
            successiveRightAnswers = UserDefaults.standard.integer(forKey: "successiveRightAnswers") + 1
            UserDefaults.standard.set(successiveRightAnswers, forKey: "successiveRightAnswers")
            
//            switch successiveRightAnswers {
//            case 5, 15, 30, 50:
//                let tuppleResponse = SuccessiveAnswer.progression(commentAfterResponse: specialCommentAfterResponse!, painterName: painterName, totalPaintings: totalPaintings)
//                specialCommentAfterResponse = tuppleResponse.0
//                totalQuestion = tuppleResponse.1
//                //MessageView.showMessageView(view: view, messageView: specialMessageView, button: specialViewOkButton, visualEffect: visualEffect, effect: effect, diplomaImageView: diplomaImageView, totalPaintings: totalPaintings)
//
//            default:
//                let tuppleResponse = SuccessiveAnswer.progression(commentAfterResponse: commentAfterResponse!, painterName: painterName, totalPaintings: totalPaintings)
//                commentAfterResponse = tuppleResponse.0
//                totalQuestion = tuppleResponse.1
//                //MessageView.showMessageView(view: view, messageView: messageView, button: okButton, visualEffect: visualEffect, effect: effect, diplomaImageView: nil, totalPaintings: totalPaintings)
//            }

        }else{
            
            commentOnResponse.text = """
            Sorry ...
            This is another
            \(painterName) painting.
            """
            let tuppleResponse = SuccessiveAnswer.progression(commentAfterResponse: commentAfterResponse!, painterName: painterName, totalPaintings: totalPaintings)
            totalQuestion = tuppleResponse.1
            soundPlayer?.playSound(soundName: "etc_error_drum", type: "mp3")
            commentAfterResponse?.text = "Sorry! It is not the right answer"
           // MessageView.showMessageView(view: view, messageView: messageView, button: okButton, visualEffect: visualEffect, effect: effect, diplomaImageView: diplomaImageView, totalPaintings: totalPaintings)
            UserDefaults.standard.set(0, forKey: "successiveRightAnswers")
        }
        successiveRightAnswers = UserDefaults.standard.integer(forKey: "successiveRightAnswers")
        QuizProgressionBar.barDisplay(successiveRightAnswers: successiveRightAnswers, quizProgressionBar: quizProgressBar, totalQuestion: totalQuestion)
        responseRatio.text = "\(successiveRightAnswers)/\(totalQuestion)"

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBonusQuiz" {
            let controller = segue.destination as! BonusQuizViewController
            controller.artistList = artistList
        }
    }

 

}
