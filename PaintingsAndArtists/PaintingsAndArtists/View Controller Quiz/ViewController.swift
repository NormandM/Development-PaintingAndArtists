//
//  ViewController.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-05-20.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let labelTitle = UILabel(frame: CGRect(x:0, y:0, width:1000, height:50))
    
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet weak var buyCreditsButton: UIButton!
    @IBOutlet weak var paintingImage: UIImageView!
    @IBOutlet var painterButton: [UIButton]!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet var hintItemButton: [UIButton]!
    @IBOutlet weak var placeHolderButton: UIButton!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var messageView: UIView!
    var effect: UIVisualEffect!
    var partTwoOfQuizDone: Bool = false
    var soundPlayer: SoundPlayer?
    var credit = UserDefaults.standard.integer(forKey: "credit")
    var finalArrayOfButtonNames = [String]()
    var artistList: [[String]] = []
    var indexPainting: [Int] = []
    var artistsCount: Int = 0
    var n = 0
    var errorCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        effect = visualEffect.effect
        messageView.layer.cornerRadius = 5
        visualEffect.effect = nil
        errorMessage.isHidden = true
        placeHolderButton.isHidden = true
        placeHolderButton.isEnabled = false
        nextButton.isHidden = true
        nextButton.isEnabled = false
        hintButton.layer.cornerRadius = hintButton.frame.height / 2.0
        hintItemButton.forEach {(eachButton) in
            eachButton.layer.cornerRadius = eachButton.frame.height / 2.0
            eachButton.isHidden = true
        }
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.black
        UserDefaults.standard.set(10, forKey: "credit")
        UserDefaults.standard.set(0, forKey: "successiveRightAnswers")
        if !(userAlreadyExist(credit: "credit")){
            credit = 10
            UserDefaults.standard.set(credit, forKey: "credit")
        }
        hintButton.setTitle("\(credit) Coins available for Hints", for: .normal)
        let randomizeOrderOfPaintings = RandomizeOrderOfPaintings(artistList: artistList)
        indexPainting = randomizeOrderOfPaintings.generatePaintingIndex(from: 0, to: artistList.count - 1, quantity: nil)
        quizElementSelection()
    }
    override func viewDidAppear(_ animated: Bool) {
        nextButton.layer.masksToBounds = true
        nextButton.layer.cornerRadius = nextButton.frame.width/2
        nextButton.backgroundColor = UIColor(displayP3Red: 27/255, green: 95/255, blue: 94/255, alpha: 1.0)
        if credit < 1 {
            MessageView.showMessageView(view: view, messageView: messageView, button: buyCreditsButton, visualEffect: visualEffect, effect: effect)
            hintButton.isHidden = true
        }
    }
    func quizElementSelection() {
        finalArrayOfButtonNames = PainterSelection.buttonsNameSelection(artistList: artistList, indexPainting: indexPainting, painterButton: painterButton, n: n)
        labelTitle.text = ""
        errorCounter = 0
        errorMessage.text = ""
        let imageName = artistList[indexPainting[n]][2]
        let image = UIImage(named: imageName)
        paintingImage.image = image
    }
    @objc func nextQuizPainting(){
        if partTwoOfQuizDone{
            n = n + 1
            quizElementSelection()
        }else{
            performSegue(withIdentifier: "showChosePainting", sender: self)
        }
        partTwoOfQuizDone = false
    }
    func userAlreadyExist(credit: String) -> Bool {
        return UserDefaults.standard.object(forKey: credit) != nil
    }
    @IBAction func painterButtonPressed(_ sender: UIButton) {
        soundPlayer = SoundPlayer()
        if let painterButtonTitle = sender.titleLabel?.text {
            if painterButtonTitle == artistList[indexPainting[n]][0]{
                for button in painterButton {
                    if button.titleLabel?.text != painterButtonTitle{
                        button.isEnabled = false
                        button.isHidden  = true
                    }
                }
                soundPlayer?.playSound(soundName: "chime_clickbell_octave_up", type: "wav")
                ButtonTranslation.translate(fromButton: sender, toButton: placeHolderButton)
                TitleDisplay.show(labelTitle: labelTitle, titleText: artistList[indexPainting[n]][2], nextButton: nextButton, view: self)
                CreditManagment.increaseOneCredit(hintButton: hintButton)
            }else{
                let shake = Shake()
                shake.shakeViewHorizontal(vw: sender)
                soundPlayer?.playSound(soundName: "etc_error_drum", type: "mp3")
                CreditManagment.decreaseTwoCredit(hintButton: hintButton)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    sender.isEnabled = false
                    sender.isHidden = true
                    if self.errorCounter > 2 {
                        LabelAndButton.buttonInvisible(painterButton: self.painterButton, errorMessage: self.errorMessage)
                        self.errorMessage.isHidden = false
                        self.errorMessage.text = """
                        Sorry...
                        The right answer is :
                        \(self.artistList[self.indexPainting[self.n]][0])
                        """
                        UserDefaults.standard.set(0, forKey: "successiveRightAnswers")
                        self.partTwoOfQuizDone = true
                        self.nextButton.isEnabled = true
                        self.nextButton.isHidden = false
                        self.nextButton.setTitle("Next", for: .normal)
                    }
                }
                errorCounter = errorCounter + 1
                
            }
        }
    }
    @IBAction func hintSelectionPress(_ sender: UIButton) {
        hintMenuAction()

    }
    @IBAction func specificHintPressed(_ sender: UIButton) {
        if let buttonLabel = sender.titleLabel?.text {
            Hint.manageHints(buttonLabel: buttonLabel, finalArrayOfButtonNames: finalArrayOfButtonNames, painterName: artistList[indexPainting[n]][0], painterButton: painterButton, placeHolderButton: placeHolderButton, labelTitle: labelTitle, view: self, nextButton: nextButton, titleText: artistList[indexPainting[n]][2], hintButton: hintButton, showBioView: showBioView)
            credit =  UserDefaults.standard.integer(forKey: "credit")
            hintButton.setTitle("\(credit) Coins available for Hints", for: .normal)
        }
        hintMenuAction()

    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        nextQuizPainting()
        nextButton.isEnabled = false
        nextButton.isHidden = true
    }
    @IBAction func buyCreditsButtonPressed(_ sender: UIButton) {
        MessageView.dismissMessageview(messageView: messageView, visualEffect: visualEffect, effect: effect)
        performSegue(withIdentifier: "showBuyCredits", sender: self)
    }
    
    func hintMenuAction() {
        hintItemButton.forEach { (eachButton) in
            UIView.animate(withDuration: 0.4, animations: {
                eachButton.isHidden = !eachButton.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }

// NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBio" {
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            backItem.tintColor = UIColor.white
            let controller = segue.destination as! infoAndImageViewController
            controller.isFromQuiz = true
            controller.bioInfoEra = artistList[indexPainting[n]][1]
            controller.bioInfoImageName = artistList[indexPainting[n]][2]
            controller.bioInfoBio = artistList[indexPainting[n]][3]
        }
        if segue.identifier == "showChosePainting" {
            let controller = segue.destination as! ChosePaintingViewController
            controller.indexPainting = indexPainting
            controller.artistList = artistList
            controller.n = n
            controller.bioInfoImageName = artistList[indexPainting[n]][2]
            
        }
    }
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {
        print("back")
        partTwoOfQuizDone = true
        nextQuizPainting()
        CreditManagment.displayCredit(hintButton: hintButton)
    }

    
    func showBioView() {
        performSegue(withIdentifier: "showBio", sender: self)
    }
    
    
}

