//
//  QuizSelectionTableViewController.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-22.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class QuizSelectionTableViewController: UITableViewController {
    var titleArray: [String] = []
    var sectionTotalArray: [[String]] = []
    var historicalDataArray: [[String]] = []
    var sectionHeaderTable: String = ""
    var sectionHeaderTable1: String = ""
    let historicalData = HistoricalData()
    override func viewDidLoad() {
        super.viewDidLoad()
        var changeOfTitleOccured = false
        var sectionArray: [String] = []
        
        
        historicalDataArray = historicalData.historicalDataArray
        var n = 0
        titleArray.append(historicalDataArray[n][0])
        sectionArray.append(historicalDataArray[n][1])
        sectionHeaderTable = historicalDataArray[n][4]
        sectionHeaderTable1 = "Drag and drop events"
        
        for _ in historicalDataArray{
            if n != 0 && historicalDataArray[n][0] != historicalDataArray[n - 1][0] {
                if historicalDataArray[n][0] != "end" {
                    titleArray.append(historicalDataArray[n][0])
                }
                changeOfTitleOccured = true
                
            }
            if n != 0 && historicalDataArray[n][1] != historicalDataArray[n - 1][1] {
                
                if changeOfTitleOccured {
                    sectionTotalArray.append(sectionArray)
                    sectionArray = []
                    changeOfTitleOccured = false
                }
                sectionArray.append(historicalDataArray[n][1])
                
            }
            
            n = n + 1

        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return titleArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionTotalArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sectionTotalArray[indexPath.section][indexPath.row]
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

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuizSelection"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let sectionDetail = sectionTotalArray[indexPath.section][indexPath.row]
                let pageTitle = titleArray[indexPath.section]
                let controller = segue.destination as! QuizViewController
                controller.pageTitle = pageTitle
                controller.sectionDetail = sectionDetail
                controller.sectionHeaderTable = sectionHeaderTable
                controller.sectionHeaderTable1 = sectionHeaderTable1
            }
        }
    }

    

}
