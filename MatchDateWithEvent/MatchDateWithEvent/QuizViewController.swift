//
//  QuizViewController.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-22.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var pageTitle: String = ""
    var sectionDetail: String = ""

    var sectionHeaderTable: String = ""
    var sectionHeaderTable1: String = ""
    var sourceIndexPath: NSIndexPath? = nil
    var snapshot: UIView? = nil
    var timer = Timer()
    var totalAvailableCredit: Int = 50
    var indexPathSelected = IndexPath()
    var timerProgressBar = Timer()
    var labelIsDropped: Bool = false
    var counter = 0
    var totalCycle = 0

    
    @IBOutlet weak var creditAvailable: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var eliminateButton: UIButton!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timerProgress: UITableView!
    @IBOutlet weak var infoDisplay: UILabel!



    
    let longPress: UILongPressGestureRecognizer = {
        let recognizer = UILongPressGestureRecognizer()
        return recognizer
    }()
    var startButton = UIButton()
    //var nextButton = UIButton()
    var resultMessageLabel = UILabel()

   // var questionArray = QuestionArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ok")
        print(sectionHeaderTable)
        print(sectionHeaderTable1)
        print(pageTitle)
        print(sectionDetail)
        
        self.title = pageTitle
        
        infoDisplay.text = ""
        self.tableView.separatorStyle = .none
        self.tableView1.separatorStyle = .none
       // timerProgress.progress = 0.0
       // longPress.addTarget(self, action:  #selector(longPressGestureRecognized(gesture:)))
        tableView1.addGestureRecognizer(longPress)
        // Formating showButton, eliminateButton, tryAgainButton, buyButton
        creditAvailable.layer.masksToBounds = true
        creditAvailable.layer.cornerRadius = creditAvailable.frame.width/2
        showButton.layer.masksToBounds = true
        showButton.layer.cornerRadius = 10
        showButton.isHidden = true
        eliminateButton.layer.masksToBounds = true
        eliminateButton.layer.cornerRadius = 10
        eliminateButton.isHidden = true
        buyButton.layer.masksToBounds = true
        buyButton.layer.cornerRadius = 10
        tryAgainButton.layer.masksToBounds = true
        tryAgainButton.layer.cornerRadius = 10
        tryAgainButton.isHidden = true
        // Creating programmaticaly startButton
        startButton = UIButton(frame: CGRect(origin: CGPoint(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100), size: CGSize(width: 200, height: 200)))
        startButton.backgroundColor = UIColor.blue
        startButton.addTarget(self, action: #selector(startButtonAction(sender:)), for: .touchUpInside)
        startButton.titleLabel?.lineBreakMode = .byWordWrapping
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        startButton.titleLabel?.textAlignment = .center
        startButton.setTitle("Ready to start? Let's go!", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        self.navigationController?.view.addSubview(startButton)
        // Creating resultMessageLabel
        resultMessageLabel = UILabel(frame: CGRect(origin: CGPoint(x: self.view.frame.width/2 - 100, y: self.view.frame.height/1.4), size: CGSize(width: 200, height: 50)))
        resultMessageLabel.backgroundColor = UIColor(red: 129/255, green: 203/255, blue: 235/255, alpha: 100)
        resultMessageLabel.lineBreakMode = .byWordWrapping
        resultMessageLabel.font = UIFont.systemFont(ofSize: 30)
        resultMessageLabel.textAlignment = .center
        resultMessageLabel.layer.masksToBounds = true
        resultMessageLabel.layer.cornerRadius = 10
        resultMessageLabel.text = "Well done!"
        resultMessageLabel.textColor = UIColor.white
        resultMessageLabel.isEnabled = false
        resultMessageLabel.isHidden = true
        self.navigationController?.view.addSubview(resultMessageLabel)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var header: String = ""
        if tableView == self.tableView {
            header = sectionHeaderTable
        }
        if tableView == self.tableView1 {
            header = sectionHeaderTable1
        }
        return header
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        var count:Int?
        if tableView == self.tableView {
            //count = historicalData.historicalDate.count
            //count = questionArray.dateArray.count
            count = 1
            
        }
        if tableView == self.tableView1 {
            //count =  historicalData.historicalEvent.count
            //count = questionArray.questionArray.count
            count = 1
            
        }
        return count!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        var count:Int?
        if tableView == self.tableView {
            count = 1
        }
        if tableView == self.tableView1 {
            count =  1
        }
        return count!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:CellForTableView?
        
        if tableView == self.tableView {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! CellForTableView)
            //cell?.dateCellLabel.text = historicalData.historicalDate[indexPath.row].0
            //cell?.dateCellLabel.text = questionArray.dateArray[indexPath.row].0
            cell?.displayWhiteDateCell(cell: cell!)
        }
        
        if tableView == self.tableView1 {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath as IndexPath) as! CellForTableView)
            //cell?.eventCellLabel.text = historicalData.historicalEvent[indexPath.row].0
            //cell?.eventCellLabel.text = questionArray.questionArray[indexPath.row].0
            
            cell?.displayWhiteEventCell(cell: cell!)
        }
        
        return (cell)!
    }

    func startButtonAction (sender: UIButton) {
        counter = 0
        startButton.isHidden = true
        startButton.isEnabled = false
       // headerLabelTableView.isHidden = false
       // let buttons = DisplayOutlet(eliminateButton: eliminateButton, tryAgainButton: tryAgainButton, showButton: showButton)
       // buttons.quizMode()
        infoDisplay.text = "Here comes the Dates!"
        infoDisplay.backgroundColor = UIColor(red: 129/255, green: 203/255, blue: 235/255, alpha: 100)
        infoDisplay.textColor = UIColor.white
        //totalCycle = historicalData.historicalEvent.count - 1
       //totalCycle = questionArray.questionArray.count - 1
        let cellDate = tableView.cellForRow(at: [0, 0]) as! CellForTableView
        cellDate.dateCellLabel.textColor = UIColor.blue
        let cellEvent = tableView1.cellForRow(at: [0, 0]) as! CellForTableView
        cellEvent.displayGrayEventCell(cell: cellEvent)
        cellEvent.isHidden = true
      //  timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
