//
//  HitoricalTableViewController.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-11-27.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit


class HitoricalTableViewController: UITableViewController {
    var selectedTitle = String()
    var viewTitle = String()
    var selectedSubject = String()
    var startDate = [String]()
    var endDate = [String]()
    var dateArray: [String] = []
    var eventArray: [String] = []
    var unitArray: [String] = []
    var historicalDataArray: [[String]] = []
    var allHistoricalDataArray: [[String]] = []
    var historicalSection: [String] = []
    var testCompleted = (String(), Bool())
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewTitle
        let allhistoricalData = AllHistoricalData(selectedTitle: selectedTitle)
        historicalSection = allhistoricalData.sectionArray
        startDate = allhistoricalData.startDate
        endDate = allhistoricalData.endDate
        print(allhistoricalData.dateArray)
        print(startDate)
        print(endDate)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historicalSection.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let descriptionString = historicalSection[indexPath.row] + ":   \(startDate[indexPath.row]) to \(endDate[indexPath.row])"
        let screenSize = ScreenSize()
        let specifiedFont1 = screenSize.identify().3
        let specifiedFont2 = screenSize.identify().4
        var mutableDescriptionString = NSMutableAttributedString()
        mutableDescriptionString = NSMutableAttributedString(string: descriptionString, attributes: [NSAttributedStringKey.font:specifiedFont1])
        mutableDescriptionString.addAttribute(NSAttributedStringKey.font,value: specifiedFont2,range: NSRange(location: 0,length: 11))
        mutableDescriptionString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location: 0,length: 11))
        cell.textLabel?.attributedText = mutableDescriptionString
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuiz"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
                let controller = segue.destination as! ViewController
                let historicaldata = HistoricalData(selectedSubject: historicalSection[indexPath.row], selectedTitle: selectedTitle)
                dateArray = historicaldata.date
                eventArray = historicaldata.event
                unitArray = historicaldata.units
                selectedSubject = historicalSection[indexPath.row]
                controller.date = dateArray
                controller.event = eventArray
                controller.units = unitArray
                print(selectedSubject)
                controller.selectedSubject = selectedSubject
                controller.selectedTitle = selectedTitle
                controller.viewTitle = viewTitle
            }
        }
    }
@IBAction func unwindToHitoricalTableViewController(segue:UIStoryboardSegue) {
        
    }
}


