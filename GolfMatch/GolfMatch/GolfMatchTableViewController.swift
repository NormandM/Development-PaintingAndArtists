//
//  GolfMatchTableViewController.swift
//  GolfMatch
//
//  Created by Normand Martin on 17-09-07.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class GolfMatchTableViewController: UITableViewController {
    let joueurs = ["Camille", "Jean S", "Jean R", "Clermont", "Denis", "Normand", "André", "Vincent", "X"]
    var selectedJoueurs = NSMutableSet()
    var arraySelection: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Choisissez les joueurs présents"

    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return joueurs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = joueurs[indexPath.row]

        return cell
    }
    func configure(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        if selectedJoueurs.contains(indexPath) {
            // selected
            cell.accessoryType = .checkmark
        }
        else {
            // not selected
            cell.accessoryType = .none
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedJoueurs.contains(indexPath) {
            // deselect
            selectedJoueurs.remove(indexPath)
            let cell2 = tableView.cellForRow(at: indexPath)!
            if let text = cell2.textLabel?.text, let n = arraySelection.index(of: text){
                arraySelection.remove(at: n)
            }
            
        }
        else {
            // select
            selectedJoueurs.add(indexPath)
            arraySelection.append(self.joueurs[indexPath.row])
        }
        let cell = tableView.cellForRow(at: indexPath)!
        configure(cell, forRowAtIndexPath: indexPath)
        
    }
    
    func showAlert () {
        let alertController = UIAlertController(title: "If faut choisir au moins 5 joueurs et moins de 9 joueurs.", message: nil, preferredStyle: .alert)
        alertController.popoverPresentationController?.sourceView = self.view
        alertController.popoverPresentationController?.sourceRect = tableView.rectForHeader(inSection: 1)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: dismissAlert)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    func dismissAlert(_ sender: UIAlertAction) {
        
    }
    @IBAction func ready(_ sender: Any) {
        if arraySelection.count < 4 || arraySelection.count > 8{
            showAlert()
        }else{
            performSegue(withIdentifier: "showTeams", sender: UIBarButtonItem.self)
        }
    }


    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTeams"{
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            let controller = segue.destination as! TeamsTableViewController
            controller.arraySelection = arraySelection

            
        }

    }
 

}
