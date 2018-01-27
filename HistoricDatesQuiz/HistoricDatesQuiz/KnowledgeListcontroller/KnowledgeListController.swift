//
//  KnowledgeListController.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-11.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class KnowledgeListController: UITableViewController {
    var listOfEvents = [[String]]()
    var listOfDates = [String]()
    var listOfEventDescription = [String]()
    var arrayOfDates = [[String]]()
    var arrayOfEventDescription = [[String]]()
    var numberOfEvents = Int()
    var quizSubjects = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let eventCompleted = CodeDataHandler.filterForCompleted(searchFor: true, inAttribute: "isCompleted")
        for event in eventCompleted!{
            if !quizSubjects.contains(event.selectedTitle!) {
                quizSubjects.append(event.selectedTitle!)
            }
        }
        var n = 0
        for _ in quizSubjects {
            var listForSubject = [String]()
            listOfDates = []
            listOfEventDescription = []
            for event in eventCompleted! {

                if event.selectedTitle == quizSubjects[n] && event.isCompleted && event.typeOfEvent == "a"{
                    listForSubject.append("\(event.date!), \(event.eventDescription!)")
                    listOfDates.append(event.date!)
                    listOfEventDescription.append(event.eventDescription!)
                    
                }
            }
            arrayOfDates.append(listOfDates)
            arrayOfEventDescription.append(listOfEventDescription)
            listOfEvents.append(listForSubject)
            n = n + 1
        }

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return quizSubjects.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfEvents[section].count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return quizSubjects[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DateAndeventTableViewCell
        cell.columnDate.text = arrayOfDates[indexPath.section][indexPath.row]
        cell.columnEventDescription.text = arrayOfEventDescription[indexPath.section][indexPath.row]
       // cell.textLabel?.numberOfLines = 0
        //cell.textLabel?.lineBreakMode = .byWordWrapping
        //cell.textLabel?.text = listOfEvents[indexPath.section][indexPath.row]

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
