//
//  KnowledgeListController.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-11.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class KnowledgeListController: UITableViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewLabel: UILabel!
    @IBOutlet weak var PercentLabel: UILabel!
    
    let screenSize = ScreenSize()
    var listOfDates = [String]()
    var selectedTitle = String()
    var viewTitle = String()
    var listOfEventDescription = [String]()
    var arrayOfPercentage = [Int]()
    var percentOfGoodResponse = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let labelTitle = UILabel(frame: CGRect(x:0, y:0, width:400, height:50))
        labelTitle.backgroundColor = .clear
        labelTitle.numberOfLines = 2
        labelTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        labelTitle.textAlignment = .center
        labelTitle.textColor = .white
        labelTitle.text = """
        \(viewTitle)
        Acquired Knowledge
        """
        self.navigationItem.titleView = labelTitle
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KnowledgeListController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        let sumOfBadResponse = CountGoodOrBadResponse.sumOfBadResponses(selectedTitle: selectedTitle)
        let sumOfGoodResponse = CountGoodOrBadResponse.sumOfGoodResponse(selectedTitle: selectedTitle)
        let totalResponse = sumOfBadResponse + sumOfGoodResponse
        if totalResponse != 0 {
            percentOfGoodResponse = Int(Double(sumOfGoodResponse) * 100/Double(totalResponse))
        }
        var listForSubject = [String]()
        listOfDates = []
        listOfEventDescription = []
       headerView.backgroundColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        headerViewLabel.font = screenSize.identify().3
        headerViewLabel.textColor = UIColor.white
        let percentText = String("\(percentOfGoodResponse)%")
        headerViewLabel.text = "You were right on first try: \(percentText)"
        guard let finishedAndSelected = CodeDataHandler.filerForCompletedSelectedTitleOfTypeA(searchForTitlte: selectedTitle, inTitleAttribute: "selectedTitle") else {
            print("There is no completed events for this title")
            return
        }
        for event in finishedAndSelected{
            guard let newdate = event.date, let newEventDescription = event.eventDescription else {print("no event date or description"); return}
            let percentageIndividual = Int(100 * Double(event.goodResponse) / (Double(event.goodResponse) + Double(event.badResponse)))
            listForSubject.append("\(newdate), \(newEventDescription)")
            listOfDates.append(newdate)
            listOfEventDescription.append(newEventDescription)
            arrayOfPercentage.append(percentageIndividual)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfDates.count
    }

    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DateAndeventTableViewCell
        cell.columnDate.textColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        cell.columnEventDescription.textColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
        cell.columnDate.font = screenSize.identify().2
        cell.columnEventDescription.font = screenSize.identify().2
        cell.columnDate.text = listOfDates[indexPath.row]
        cell.columnEventDescription.text = listOfEventDescription[indexPath.row]
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMenu" {
            
        }
    }
    
    @objc func back(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showMenu", sender: self)

    }
}
