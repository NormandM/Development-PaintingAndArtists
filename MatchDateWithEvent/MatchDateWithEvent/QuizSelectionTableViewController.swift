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
    var sectionDetail: String = ""
    var sectionTotalArray: [[String]] = []
    var historicalDataArray: [[String]] = []
    var sectionHeaderTable: String = ""
    var sectionHeaderTable1: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var changeOfTitleOccured = false
        var sectionArray: [String] = []
        
        let historicalData = HistoricalData()
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
        print(sectionTotalArray)
        print(titleArray)
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTotalArray[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sectionTotalArray[indexPath.section][indexPath.row]
        return cell
    }
    
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuizSelection"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                sectionDetail = sectionTotalArray[indexPath.section][indexPath.row]
                let pageTitle = titleArray[indexPath.section]
                let controller = segue.destination as! QuizViewController
                let backItem = UIBarButtonItem()
                backItem.title = "Home"
                navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
                
                controller.sectionTotalArray = sectionTotalArray
                controller.titleArray = titleArray
                controller.pageTitle = pageTitle
                controller.sectionDetail = sectionDetail
                controller.sectionHeaderTable = sectionHeaderTable
                controller.sectionHeaderTable1 = sectionHeaderTable1
            }
        }
    }
    

}
