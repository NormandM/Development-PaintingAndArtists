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
    
    @IBOutlet weak var totalCreditLabel: UILabel!
    @IBOutlet weak var LoadingVideo: UILabel!
    
    var rewardBasedAdd = GADRewardBasedVideoAd.sharedInstance()
    var creditPublicity = UserDefaults.standard.integer(forKey: "credit")
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = ScreenSize()
        totalCreditLabel.font = screenSize.identify().11
        LoadingVideo.font = screenSize.identify().12
        let credit = UserDefaults.standard.integer(forKey: "credit")
        totalCreditLabel.text = "Your have a total of \(credit) credits"
        rewardBasedAdd.delegate = self
        rewardBasedAdd.load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        UserDefaults.standard.set(creditPublicity, forKey: "credit")
    }
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        var credit = UserDefaults.standard.integer(forKey: "credit")
        credit = credit + 50
        UserDefaults.standard.set(credit, forKey: "credit")
        credit = UserDefaults.standard.integer(forKey: "credit")
        UserDefaults.standard.set(credit, forKey: "credit")
        totalCreditLabel.text = "Your have a total of \(credit) credits"
        LoadingVideo.text = "You have received 50 credits"
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
        
        
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        if rewardBasedAdd.isReady {
            rewardBasedAdd.present(fromRootViewController: self)
        }
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad has completed.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
        print("Reward based video ad is closed.")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        // clicked on add to go to publicity
        var credit = UserDefaults.standard.integer(forKey: "credit")
        credit = credit + 50
        UserDefaults.standard.set(credit, forKey: "credit")
        credit = UserDefaults.standard.integer(forKey: "credit")
        UserDefaults.standard.set(credit, forKey: "credit")
        totalCreditLabel.text = "Your have a total of \(credit) credits"
        LoadingVideo.text = "You have received \(credit) credits"
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print(error)
        LoadingVideo.text = "Sorry, the video failed to load. Please try later"
        print("Reward based video ad failed to load.")
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
