//
//  PurchaseCreditsController.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-06.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class PurchaseCreditsController: UIViewController {
    var credit: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionBuyCredits(_ sender: UIButton) {
        credit = 20
        UserDefaults.standard.set(credit, forKey: "credit")
    }
    @IBAction func OK(_ sender: Any) {
        performSegue(withIdentifier: "goBackToTheQuiz", sender: self)
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBackToTheQuiz" {
            let controller = segue.destination as! ViewController
            controller.credit = credit
        }
    }

    


}
