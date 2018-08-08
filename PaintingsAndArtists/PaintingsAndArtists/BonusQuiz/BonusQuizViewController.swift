//
//  BonusQuizViewController.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-26.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
import MobileCoreServices

class BonusQuizViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate,   UICollectionViewDelegateFlowLayout{

    

    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var labelMessageView: UILabel!
    @IBOutlet var messageView: UIView!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var bioDateLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var firstPaintingLabel: SpecialLabel!
    @IBOutlet weak var secondPaintingLabel: SpecialLabel!
    var effect: UIVisualEffect!
    var totalNameArray = [[String]]()
    var artistList = [[String]]()
    var shuffledNameArray = [String]()
    var indexShuffledName = [(Int, String)]()
    var indexResponse = [(Int, String)]()
    var nameArray = [String]()
    var n = 0
    override func viewDidLoad() {
        effect = visualEffect.effect
        messageView.layer.cornerRadius = 5
        visualEffect.effect = nil
        titleLable.text = "Painter Biography Quiz"
        let allInfo = ArrayManagement.manageArray(artistList: artistList)
        firstPaintingLabel.leftInset = 20
        firstPaintingLabel.rightInset = 20
        secondPaintingLabel.leftInset = 20
        secondPaintingLabel.rightInset = 20
        bioDateLabel.text = allInfo.1
        bioTextView.text = allInfo.3
        firstPaintingLabel.text = allInfo.2
        secondPaintingLabel.text = allInfo.4
        totalNameArray = allInfo.5
        nameArray = totalNameArray[0]
        shuffledNameArray = totalNameArray[1]
        let indexNames = LetterChoice.indexLetter(painterName: nameArray, shuffledPainterName: shuffledNameArray)
        indexResponse = indexNames.0
        indexShuffledName = indexNames.1
        bioTextView.layer.borderWidth = 2
        bioTextView.layer.borderColor = UIColor.white.cgColor
        bioTextView.textContainerInset = UIEdgeInsetsMake(10, 20, 20, 20)
    }

    @IBOutlet weak var answerCollectioView: UICollectionView!{
        didSet{
            answerCollectioView.dataSource = self
            answerCollectioView.delegate = self
        }
    }
    @IBAction func okButtonPressed(_ sender: UIButton) {
        MessageView.dismissMessageview(messageView: messageView, visualEffect: visualEffect, effect: effect)
        performSegue(withIdentifier: "backToViewController", sender: self)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return totalNameArray.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return totalNameArray[section].count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: CGFloat(0), height: CGFloat(20))
        }else{
            let height = answerCollectioView.frame.height/4
            return CGSize(width: CGFloat(10), height: height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as! AnswerCollectionViewCell
            cell2.answerLetter.text = totalNameArray[indexPath.section][indexPath.item]
        if indexPath.section == 1{
            cell2.layer.borderColor = UIColor.white.cgColor
            cell2.layer.borderWidth = 2
            cell2.answerLetter.textColor = UIColor.white
        }else if indexPath.section == 0{
            cell2.layer.borderColor = UIColor.clear.cgColor
            cell2.answerLetter.textColor = UIColor.white
            if cell2.answerLetter.text != " " {
                cell2.answerLetter.text = "__"
            }
        }
        return cell2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell =  collectionView.cellForItem(at: indexPath) as! AnswerCollectionViewCell
        let letter = cell.answerLetter.text
        if indexPath.section == 1 {
            var i = 0
            for response in indexResponse {
                if response.1 == "__"{
                    n = i
                    break
                }
                i = i + 1
            }
            let cell2 = collectionView.cellForItem(at: [0, n]) as! AnswerCollectionViewCell
            cell2.answerLetter.text = letter
            cell.answerLetter.text = ""
            cell.isUserInteractionEnabled = false
            indexResponse[n] = indexShuffledName[indexPath.item]
            indexShuffledName[indexPath.item] = (indexPath.item, "__")
            n = n + 1
        }else if indexPath.section == 0 {
            cell.answerLetter.text = "__"
            let letterTouched = indexResponse[indexPath.item]
            let path = letterTouched.0
            let letter = letterTouched.1
            let cell2 = collectionView.cellForItem(at: [1, path]) as! AnswerCollectionViewCell
            cell2.answerLetter.text = letter
            cell2.isUserInteractionEnabled = true
            indexShuffledName[path] = indexResponse[indexPath.item]
            indexResponse[indexPath.item] = (indexPath.item, "__")
        }
        if n == indexResponse.count {
            let isResponseGood = CheckingReponse.goodOrBad(indexResponse: indexResponse, painterName: nameArray)
            MessageView.showMessageView(view: view, messageView: messageView, button: okButton, visualEffect: visualEffect, effect: effect, diplomaImageView: nil, totalPaintings: nil)
        }
    }
    
    /////////////////////////////////////////////////////////////////////////
    //Compute the dimension of a cell for an NxN layout with space S between
    // cells.  Take the collection view's width, subtract (N-1)*S points for
    // the spaces between the cells, and then divide by N to find the final
    // dimension for the cell's width and height.
    /////////////////////////////////////////////////////////////////////////
    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 11
        let spaceBetweenCells: CGFloat = 2
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        return CGSize(width: dim, height: dim)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


