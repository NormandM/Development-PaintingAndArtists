//
//  PublicityViewController.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-06.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
import GoogleMobileAds

class PublicityViewController: UIViewController, GADRewardBasedVideoAdDelegate {
    
    @IBOutlet weak var iconeVerticalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var iconeImageView: UIImageView!
    
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var LoadingVideo: UILabel!
    @IBOutlet weak var counterLabel: CountingLabel!
    var activityIndicatorView: ActivityIndicatorView!
    var rewardBasedAdd = GADRewardBasedVideoAd.sharedInstance()
    var creditPublicity = UserDefaults.standard.integer(forKey: "credit")
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = ScreenSize()
        let appDelegate = AppDelegate()
        let orientation = appDelegate.rotated()
        self.activityIndicatorView = ActivityIndicatorView(title: "Loading Video...", center: self.view.center)
        self.view.addSubview(self.activityIndicatorView.getViewActivityIndicator())
        self.activityIndicatorView.startAnimating()
        if screenSize.identify().0 == "small" {
            iconeVerticalConstraint.constant = -150
        }else if screenSize.identify().0 == "average"{
            iconeVerticalConstraint.constant = -175
        }else if screenSize.identify().0 == "extraLarge" && !orientation{
            iconeVerticalConstraint.constant = -220
        }else if screenSize.identify().0 == "extraExtraLarge" && !orientation{
            iconeVerticalConstraint.constant = -250
        }else if screenSize.identify().0 == "extraExtraLarge" && !orientation{
            iconeVerticalConstraint.constant = -300
        }
        iconeImageView.isHidden = true
        LoadingVideo.text = ""
        counterLabel.text = ""
        creditLabel.text = ""
        okButton.isHidden = true
        counterLabel.textColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        LoadingVideo.font = screenSize.identify().12
        creditLabel.font = screenSize.identify().12
        counterLabel.font = screenSize.identify().13
        rewardBasedAdd.delegate = self
        rewardBasedAdd.load(GADRequest(), withAdUnitID: "ca-app-pub-1437510869244180/4741335539")
        UserDefaults.standard.set(creditPublicity, forKey: "credit")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let credit = UserDefaults.standard.integer(forKey: "credit")
        if credit == 50 {
            counterLabel.count(fromValue: 0, toValue: 50, withDuration: 5, andAnimationType: .EaseOut, andCounterType: .Int)
        }else if credit == 100 {
            counterLabel.count(fromValue: 0, toValue: 100, withDuration: 5, andAnimationType: .EaseOut, andCounterType: .Int)
        }

    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        var credit = UserDefaults.standard.integer(forKey: "credit")
        credit = credit + 50
        UserDefaults.standard.set(credit, forKey: "credit")
        credit = UserDefaults.standard.integer(forKey: "credit")
        UserDefaults.standard.set(credit, forKey: "credit")
        LoadingVideo.text = "You have received:"
        creditLabel.text = "credits"
        iconeImageView.isHidden = false
        okButton.isHidden = false

    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        if rewardBasedAdd.isReady {
            rewardBasedAdd.present(fromRootViewController: self)
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {

    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        let credit = UserDefaults.standard.integer(forKey: "credit")
        if credit == 0 {
            LoadingVideo.text = "The video was closed before getting the reward"
            okButton.isHidden = false
        }
        
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        var credit = UserDefaults.standard.integer(forKey: "credit")
        credit = credit + 50
        UserDefaults.standard.set(credit, forKey: "credit")
        credit = UserDefaults.standard.integer(forKey: "credit")
        UserDefaults.standard.set(credit, forKey: "credit")
        LoadingVideo.text = "You have received"
        
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        self.activityIndicatorView.stopAnimating()
        LoadingVideo.text = "Sorry, the video failed to load. Please try later"
        okButton.isHidden = false
        
    }

    @IBAction func Ok(_ sender: Any) {
        performSegue(withIdentifier: "goBackToQuiz", sender: self)
    }
    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBackToQuiz" {
            let controller = segue.destination as! ViewController
            controller.credit = creditPublicity
        }
        
    }

}
