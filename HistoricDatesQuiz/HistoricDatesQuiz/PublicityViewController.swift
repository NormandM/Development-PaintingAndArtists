//
//  PublicityViewController.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-06.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class PublicityViewController: UIViewController {

    var creditPublicity = UserDefaults.standard.integer(forKey: "credit")
    override func viewDidLoad() {
        super.viewDidLoad()
        creditPublicity = creditPublicity + 20
        UserDefaults.standard.set(creditPublicity, forKey: "credit")
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
