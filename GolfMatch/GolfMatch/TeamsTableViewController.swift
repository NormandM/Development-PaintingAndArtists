//
//  TeamsTableViewController.swift
//  GolfMatch
//
//  Created by Normand Martin on 17-09-07.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {
    var arraySelection: [String] = []
    var team = ["Équipe 1", "Équipe 2"]
    var nombreDeJoueurs: Int = 0
    var teamArray: [[String]] = []
    var message: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomArray = arraySelection.shuffled
        self.title = "Voici vos équipes!"
        print(arraySelection)
        nombreDeJoueurs = arraySelection.count
        switch nombreDeJoueurs{
        case 5 : teamArray = randomArray.chunks(3)
        case 6 : teamArray = randomArray.chunks(3)
        case 7 : teamArray = randomArray.chunks(4)
        case 8 : teamArray = randomArray.chunks(4)
        default: message = "Arrangez-vous tout seul"
        }
        print(teamArray)
        if message != "" {print(message)}

    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return team.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return team[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teamArray[section].count
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 151/255, green: 156/255, blue: 159/255, alpha: 1.0) //make the background color light blue
        header.textLabel!.textColor = UIColor.white //make the text white
        header.alpha = 1.0 //make the header transparent
        
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = teamArray[indexPath.section][indexPath.row]

        return cell
    }
 

}
extension Array {
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        indices.dropLast().forEach {
            guard case let index = Int(arc4random_uniform(UInt32(count - $0))) + $0, index != $0 else { return }
            swap(&self[$0], &self[index])
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
extension Array {
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}



