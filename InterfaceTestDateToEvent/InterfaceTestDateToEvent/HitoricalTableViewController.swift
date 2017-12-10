//
//  HitoricalTableViewController.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-11-27.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class HitoricalTableViewController: UITableViewController {
    let historicalData = HistoricalData(questionGroup: "All")
    var historicalDataArray: [[String]] = []
    var historicalSection: [String] = []
    var historicalSubjectList: [[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        historicalDataArray = historicalData.historicalDataArray
        historicalSection = historicalData.historicalSection
        historicalSubjectList =  historicalData.historicalSubjectList
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return historicalSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historicalSubjectList[section].count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return historicalSection[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = historicalSubjectList[indexPath.section][indexPath.row]

        return cell
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuiz"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedSubject = historicalSubjectList[indexPath.section][indexPath.row]
                let controller = segue.destination as! ViewController
                controller.selectedSubject = selectedSubject
            }
        }
    }
    

}
