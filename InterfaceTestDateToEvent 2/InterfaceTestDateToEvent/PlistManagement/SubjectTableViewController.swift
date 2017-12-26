//
//  SubjectTableViewController.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-12-22.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class SubjectTableViewController: UITableViewController {
    var sectionTitle = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = Title()
        sectionTitle = title.splitString()
        self.title = "Historic Events"
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTitle.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let title = sectionTitle[indexPath.row]
        let screenSize = ScreenSize()
        let fontOfRow = screenSize.identify().4
        
        cell.textLabel?.text = title
        cell.textLabel?.font = fontOfRow
        cell.textLabel?.textColor = UIColor.blue
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistoricalTableView"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
                var selectedTitle = sectionTitle[indexPath.row]
                let viewTitle = selectedTitle
                selectedTitle = selectedTitle.replacingOccurrences(of: " ", with: "")
                let controller = segue.destination as! HitoricalTableViewController
                controller.viewTitle = viewTitle
                controller.selectedTitle = selectedTitle
                print(selectedTitle)
                
            }
        }

    }

}
