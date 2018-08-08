//
//  SlideShowViewController.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-05-23.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
import AVFoundation

class SlideShowViewController: UIViewController {
    @IBOutlet weak var slideShowUIImageView: UIImageView!
    var audioPlayer: AVAudioPlayer?
    var artistList: [[String]] = []
    var artistsCount = 0
    var vueTimer = Timer()
    var counterAnimation = 0
    var n = 0
    var x: CGFloat = 0
    var y: CGFloat = 0
    var indexPainting: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.black
        UIApplication.shared.isIdleTimerDisabled = true
        let path = Bundle.main.path(forResource: "Gymnopédie_no.3", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
            
        } catch {
            // couldn't load file :(
        }
        let randomizeOrderOfPaintings = RandomizeOrderOfIndexArray(artistList: artistList)
        indexPainting = randomizeOrderOfPaintings.generateRandomIndex(from: 0, to: artistList.count - 1, quantity: nil)
        ImageManager.choosImage(imageView: slideShowUIImageView, imageName: artistList[indexPainting[n]][2])
        vueTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SlideShowViewController.zoomAnimation), userInfo: nil, repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        vueTimer.invalidate()
        UIApplication.shared.isIdleTimerDisabled = false

    }


    @objc func changePainting () {
        if  counterAnimation > 80{
            x = 0
            y = 0
            counterAnimation = 0
            if n < artistsCount - 1{
                n = n + 1
            }else {
                n = 0
            }
            ImageManager.choosImage(imageView: slideShowUIImageView, imageName: artistList[indexPainting[n]][2])            
        }
 
    }
    @objc func zoomAnimation () {
        counterAnimation = counterAnimation + 1
        if counterAnimation > 30 {
            UIView.animate(withDuration: 1,
                           delay: 0.0,
                           options: .allowUserInteraction,
                           animations: {
                            self.slideShowUIImageView.frame.size.width += self.slideShowUIImageView.frame.size.width/50
                            self.slideShowUIImageView.frame.size.height += self.slideShowUIImageView.frame.size.height/50
                            self.slideShowUIImageView.frame =  CGRect(origin:  CGPoint(x: self.x, y: self.y), size: self.slideShowUIImageView.frame.size)
                            self.x = self.x - self.slideShowUIImageView.frame.size.width/100
                            self.y = self.y - self.slideShowUIImageView.frame.size.height/100
            }, completion: {finished in self.changePainting()})
        }
    }
    
    @IBAction func tapToIdentify(_ sender: UITapGestureRecognizer) {
        slideShowUIImageView.stopAnimating()
        vueTimer.invalidate()
        performSegue(withIdentifier: "showPaintingInfo", sender: self)
    }
 

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showPaintingInfo" {
            let controller = segue.destination as! infoAndImageViewController
            controller.specificArtistInfo = indexPainting[n]
            controller.artistList = artistList
        }

        
    }
    @IBAction func unwindToSlideShow(_ sender: UIStoryboardSegue) {
        vueTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SlideShowViewController.zoomAnimation), userInfo: nil, repeats: true)

    }


}
