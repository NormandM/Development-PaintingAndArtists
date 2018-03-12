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
    //var totalNumber = Int()
    //var finishedInTitle = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = Title()
        sectionTitle = title.splitString()
        self.title = "Historical Eras"
        self.navigationItem.setHidesBackButton(true, animated:true)
        
//        if CodeDataHandler.cleanDelete(){
//            let event = CodeDataHandler.fetchObject()
//            print ("number of events = \(event!.count)")
//        }
//        UserDefaults.standard.set(false, forKey: "SpacePioneers")
//        UserDefaults.standard.set(false, forKey: "WorldWarII")
//        UserDefaults.standard.set(false, forKey: "WorldWarI")
//        UserDefaults.standard.set(false, forKey: "GreatExplorers")
//        UserDefaults.standard.set(false, forKey: "AmericanCivilWar")
//        UserDefaults.standard.set(false, forKey: "Napoleon")
//        UserDefaults.standard.set(false, forKey: "FrenchRevolution")
//        UserDefaults.standard.set(false, forKey: "AncientCivilisation")
//        UserDefaults.standard.set(false, forKey: "LifeEvolution")
//        UserDefaults.standard.set(false, forKey: "AmericanRevolution")
        
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
        let heightOfVisibleTableViewArea = view.safeAreaLayoutGuide.layoutFrame.height
        let numberOfRows = tableView.numberOfRows(inSection: 0)
        tableView.rowHeight = heightOfVisibleTableViewArea / CGFloat(numberOfRows)
        let title = sectionTitle[indexPath.row]
        let screenSize = ScreenSize()
        let fontOfRow = screenSize.identify().4
        sectionSubject = title.replacingOccurrences(of: " ", with: "")
        arraySectionSubject.append(sectionSubject)
        let totalNumber = loadingCellValue().0
        let finishedInTitle = loadingCellValue().1
        isQuizFinished.0 = indexPath.row
        isQuizFinished.1 = false
        arrayIsQuizFinished.append(isQuizFinished)
        cell.iconeImageView.removeFromSuperview()
        cell.textTitle.removeFromSuperview()
        if let iconeName = Image(rawValue: sectionSubject){
            let name = iconeName.nameIcone
            cell.addSubview(cell.icone(name: name))
        }
        if finishedInTitle == totalNumber && totalNumber > 0{
            isQuizFinished.1 = true
            let name = "mortarboard.png"
            cell.addSubview(cell.icone(name: name))
        }
        let textTitle = cell.textTitle
        cell.addSubview(textTitle)
        textTitle.text = title
        textTitle.font = fontOfRow
        textTitle.textColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
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
        arrayIsQuizFinished = []
        arraySectionSubject = []
        tableView.reloadData()
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
        selectedTitle = sectionTitle[row]
        selectedTitle = selectedTitle.replacingOccurrences(of: " ", with: "")
        for finished in arrayIsQuizFinished {
            if finished.0 == row {
                arrayIsQuizFinished[row].1 = false
            }
        }
        if let finishedInTitle = CodeDataHandler.filterForCompletedForSelectedTitle(searchForTitlte: selectedTitle, inTitleAttribute: "selectedTitle"){
            for event in finishedInTitle {
                event.isCompleted = false
                event.numberCompleted = 0
                if CodeDataHandler.saveSingleObject(event: event){
                }else{print("was not saved")}
            }
        }

        performSegue(withIdentifier: "showQuiz", sender: self)
    }
    
    func goBackToMenu() {

    }

    func loadingCellValue() -> (Int, Int){
        var totalNumber = Int()
        var finishedInTitle = Int()
        if let totalNumberTrans = (CodeDataHandler.filterData(searchFor: sectionSubject, inAttribute: "selectedTitle")?.count){
            totalNumber = totalNumberTrans
        }else{
            print("There is no data for this selectedTitle")
        }
        if let finishedInTitleTrans = (CodeDataHandler.filterForCompletedForSelectedTitle(searchForTitlte: sectionSubject, inTitleAttribute: "selectedTitle")?.count){
            finishedInTitle = finishedInTitleTrans
        }else{
            print("There is no finished events for this title")
        }
        return (totalNumber, finishedInTitle)
    }
    // reformating for orientation changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: {
            _ in

            self.tableView.reloadData()
        })
    }
}