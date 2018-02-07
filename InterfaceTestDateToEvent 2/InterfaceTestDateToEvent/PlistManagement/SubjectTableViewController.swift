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
    var isQuizFinished: (Int, Bool) = (0, false)
    var arrayIsQuizFinished = [(Int, Bool)]()
    var sectionSubject = String()
    var arraySectionSubject = [String]()
    var selectedTitle = String()
    var indexPathSelected = IndexPath()
    var diplomaImageView = UIImageView()
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
        
        
//        let events = CodeDataHandler.fetchObject()
//        var n = 0
//        for event in events! {
//            events![n].isCompleted = true
//
//            CodeDataHandler.saveSingleObject(event: events![n])
//            print(events![n])
//            n = n + 1
//        }

    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTitle.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SubjectTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubjectTableViewCell
        cell.addSubview(cell.diplomaImageView)
        cell.hideImage()
        let title = sectionTitle[indexPath.row]
        let screenSize = ScreenSize()
        let fontOfRow = screenSize.identify().4
        sectionSubject = title.replacingOccurrences(of: " ", with: "")
        arraySectionSubject.append(sectionSubject)
        let totalNumber = CodeDataHandler.filterData(searchFor: sectionSubject, inAttribute: "selectedTitle")?.count
        let finishedInTitle = CodeDataHandler.filterForCompletedForSelectedTitle(searchForTitlte: sectionSubject, inTitleAttribute: "selectedTitle")?.count
        isQuizFinished.0 = indexPath.row
        isQuizFinished.1 = false
        if let finishedInTitle = finishedInTitle {
            if finishedInTitle == totalNumber! && totalNumber! > 0{
                isQuizFinished.1 = true
                cell.showImage()
            }
        }
        arrayIsQuizFinished.append(isQuizFinished)
        let textTitle = UILabel(frame: CGRect(origin: CGPoint(x: 55, y: 0 ), size: CGSize(width: 150, height: 50)))
        cell.addSubview(textTitle)
        textTitle.text = title
        textTitle.font = fontOfRow
        textTitle.textColor = UIColor.blue
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuiz"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                indexPathSelected = indexPath
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
                selectedTitle = sectionTitle[indexPath.row]
                let viewTitle = selectedTitle
                selectedTitle = selectedTitle.replacingOccurrences(of: " ", with: "")
                for isQuiz in arrayIsQuizFinished{
                    if isQuiz.0 == indexPath.row && isQuiz.1 {
                        showAlertDoAgainOrNot()
                    }
                }
                let allhistoricalData = AllHistoricalData(selectedTitle: selectedTitle)
                let historicalDataArray = allhistoricalData.historicalDataArray
                let databaseWasCreated = UserDefaults.standard.bool(forKey: selectedTitle)
                if !databaseWasCreated {
                    for historicData in historicalDataArray{
                        _ = CodeDataHandler.saveObject(selectedTitle: selectedTitle, date: historicData[2], eventDescription: historicData[3], isCompleted: false, numberCompleted: 0, quizNumber: historicData[1], typeOfEvent: historicData[4], goodResponse: 0, badResponse: 0)
                    }
                    UserDefaults.standard.set(true, forKey: selectedTitle)
                    UserDefaults.standard.synchronize()
                }
                let quiz = FetchDataForQuiz.fetchData(selectedTitle: selectedTitle)
                if quiz == [] {showAlertDoAgainOrNot()}
                let controller = segue.destination as! ViewController
                controller.newQuiz = quiz
                controller.viewTitle = viewTitle
                controller.selectedTitle = selectedTitle
                controller.arraySectionSubject = arraySectionSubject
            }
        }
    }
    @IBAction func unwindFromQuiz(segue: UIStoryboardSegue){

    }
    func showAlertDoAgainOrNot () {
        let alert = UIAlertController(title: "You have mastered this Quiz", message: "Do you want to  do it again?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes I want to do start over!", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.doTheQuizAgain()}))
        alert.addAction(UIAlertAction(title: "No, go back to the menu.", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.goBackToMenu()}))
        self.present(alert, animated: true, completion: nil)
    }
    func doTheQuizAgain() {
        let cell = tableView.cellForRow(at: indexPathSelected) as! SubjectTableViewCell
        cell.hideImage()
        let row = indexPathSelected.row
        for finished in arrayIsQuizFinished {
            if finished.0 == row {
                print(row)
                arrayIsQuizFinished[row].1 = false
            }
        }
        let finishedInTitle = CodeDataHandler.filterForCompletedForSelectedTitle(searchForTitlte: selectedTitle, inTitleAttribute: "selectedTitle")
        for event in finishedInTitle! {
            event.isCompleted = false
            if CodeDataHandler.saveSingleObject(event: event){
            }else{print("was not saved")}
        }
    }
    func goBackToMenu() {
        
    }

}
