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
    var numberOfEvents = Int()
    var numberOfQuizCompleted = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = Title()
        sectionTitle = title.splitString()
        self.title = "Historic Events"
//        if CodeDataHandler.cleanDelete(){
//            let event = CodeDataHandler.fetchObject()
//            print ("number of events = \(event!.count)")
//        }
//        UserDefaults.standard.set(false, forKey: "SpacePioneers")
//        UserDefaults.standard.set(false, forKey: "WorldWarII")
        
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
        
        if segue.identifier == "showQuiz"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                var event: [Event]? = nil
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
                var selectedTitle = sectionTitle[indexPath.row]
                let viewTitle = selectedTitle
                selectedTitle = selectedTitle.replacingOccurrences(of: " ", with: "")
                let allhistoricalData = AllHistoricalData(selectedTitle: selectedTitle)
                let historicalDataArray = allhistoricalData.historicalDataArray
                let databaseWasCreated = UserDefaults.standard.bool(forKey: selectedTitle)
                if !databaseWasCreated {
                    for historicData in historicalDataArray{
                        _ = CodeDataHandler.saveObject(selectedTitle: selectedTitle, date: historicData[2], eventDescription: historicData[3], isCompleted: false, numberCompleted: 0, quizNumber: historicData[1], typeOfEvent: historicData[4])
                    }
                    UserDefaults.standard.set(true, forKey: selectedTitle)
                    UserDefaults.standard.synchronize()
                }
                event = CodeDataHandler.fetchObject()
                numberOfEvents = (event?.count)!
                var numberOfQuizCompleted = 0
                var quiz = [Event]()
                var n = 0
                var reference = 0
                if let event = event{
                    
                    for events in event {
                        if events.isCompleted && events.selectedTitle == selectedTitle{
                            numberOfQuizCompleted = numberOfQuizCompleted + 1
                            events.numberCompleted = Int32(numberOfQuizCompleted)
                            if !CodeDataHandler.saveSingleObject(event: events) {
                                print("Nothing was saved")
                            }
                        }else if events.selectedTitle == selectedTitle{
                            reference = n
                            break
                        }
                        n = n + 1
                    }
                    for n in reference ... reference + 5 {
                        quiz.append(event[n])
                    }
                }
                let controller = segue.destination as! ViewController
                controller.newQuiz = quiz
                controller.viewTitle = viewTitle
                controller.selectedTitle = selectedTitle
            }
        }
    }
    @IBAction func unwindFromQuiz(segue: UIStoryboardSegue){

    }
    
}
