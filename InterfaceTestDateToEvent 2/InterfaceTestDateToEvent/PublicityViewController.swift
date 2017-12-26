//
//  PublicityViewController.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-12-06.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class PublicityViewController: ViewController {
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
