//
//  ViewController.swift
//  DateTest3
//
//  Created by Normand Martin on 17-07-14.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var sectionDetail: String = ""
    var pageTitle: String = ""
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
    @IBOutlet weak var infoDisplay: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var eliminateButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    let headerLabelTableView = UILabel()
    let headerLabelTableView1 = UILabel()
    
    //var historicalData = HistoricalData()
    var questionArray = QuestionArray()
    
    let longPress: UILongPressGestureRecognizer = {
        let recognizer = UILongPressGestureRecognizer()
        return recognizer
    }()
    var startButton = UIButton()
    var nextButton = UIButton()
    var resultMessageLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        
        infoDisplay.text = ""
        self.tableView.separatorStyle = .none
        self.tableView1.separatorStyle = .none
        timerProgress.progress = 0.0
        longPress.addTarget(self, action:  #selector(longPressGestureRecognized(gesture:)))
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
            count = questionArray.dateArray.count
        }
        if tableView == self.tableView1 {
            //count =  historicalData.historicalEvent.count
            count = questionArray.questionArray.count
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
// Formating Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerLabel = UILabel()
        if tableView == self.tableView{
            headerLabelTableView.backgroundColor = UIColor.white
            headerLabelTableView.font = UIFont(name: "Verdana", size: 20)
            headerLabelTableView.textColor = UIColor.blue
            headerLabelTableView.text = self.tableView(self.tableView, titleForHeaderInSection: section)
            headerLabelTableView.textAlignment = .center
            headerLabelTableView.numberOfLines = 0
            headerLabelTableView.lineBreakMode = .byWordWrapping
            headerLabelTableView.isHidden = true
            headerLabel = headerLabelTableView
        }
        if tableView == self.tableView1{
            //headerLabelTableView1.backgroundColor = UIColor.lightGray
            headerLabelTableView1.font = UIFont(name: "Verdana", size: 20)
            headerLabelTableView1.textColor = UIColor.blue
            headerLabelTableView1.text = self.tableView(self.tableView1, titleForHeaderInSection: section)
            headerLabelTableView1.layer.masksToBounds = true
            headerLabelTableView1.layer.cornerRadius = 10
            headerLabelTableView1.textAlignment = .center
            headerLabelTableView1.numberOfLines = 0
            headerLabelTableView1.lineBreakMode = .byWordWrapping
            headerLabelTableView1.isHidden = true
            headerLabel = headerLabelTableView1
        }

        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height: CGFloat?
        if tableView == self.tableView{
            height = 60
        }
        if tableView == self.tableView1{
            height = 60
        }
        return height!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:CellForTableView?
        
        if tableView == self.tableView {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! CellForTableView)
            //cell?.dateCellLabel.text = historicalData.historicalDate[indexPath.row].0
            cell?.dateCellLabel.text = questionArray.dateArray[indexPath.row].0
            cell?.displayWhiteDateCell(cell: cell!)
        }
        
        if tableView == self.tableView1 {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath as IndexPath) as! CellForTableView)
            //cell?.eventCellLabel.text = historicalData.historicalEvent[indexPath.row].0
            cell?.eventCellLabel.text = questionArray.questionArray[indexPath.row].0
            
            cell?.displayWhiteEventCell(cell: cell!)
        }
        
    return (cell)!
    }
    
 // Timing of the display of the dates for the quiz
    func runTimedCode() {
        totalCycle = totalCycle - 1
        counter = counter + 1
        let questionTimer = QuestionTimer(tableView: tableView, tableView1: tableView1, totalCycle: totalCycle, counter: counter)
        let responseFromQuestionTimer = questionTimer.runTimedCode()
        if responseFromQuestionTimer.0{
            questionArray = responseFromQuestionTimer.1
            timer.invalidate()
            counter = 51
            timerProgressBar = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimerProgress), userInfo: nil, repeats: true)
            headerLabelTableView1.isHidden = false
        }

    }
    
// Timing for total time to respond and checking result
    func runTimerProgress() {
        counter = counter - 1
        let timeCounter = String(counter)
        infoDisplay.text = "Time remaining: \(timeCounter)"
        let progress: Double = Double(counter)
        timerProgress.progress = Float(progress)/50
        //let checkResponse = CheckResponse(historicalData: historicalData, tableView1: tableView1, counter: counter, labelIsDropped: labelIsDropped)
        let checkResponse = CheckResponse(questionArray: questionArray, tableView1: tableView1, counter: counter, labelIsDropped: labelIsDropped)
        let responseIsGood = checkResponse.checkResponse()
        if responseIsGood && (progress < 0 || labelIsDropped == true){
            resultMessage()
            resultMessageLabel.text = "Well Done!"
        }else if responseIsGood == false && (progress < 0 || labelIsDropped == true){
            let displayButtons = DisplayOutlet(eliminateButton: eliminateButton, tryAgainButton: tryAgainButton, showButton: showButton)
            displayButtons.forWrongAnswer()
            resultMessage()
            resultMessageLabel.text = "Sorry!"

        }

    }
    func startButtonAction (sender: UIButton) {
        counter = 0
        startButton.isHidden = true
        startButton.isEnabled = false
        headerLabelTableView.isHidden = false
        let buttons = DisplayOutlet(eliminateButton: eliminateButton, tryAgainButton: tryAgainButton, showButton: showButton)
        buttons.quizMode()
        infoDisplay.text = "Here comes the Dates!"
        infoDisplay.backgroundColor = UIColor(red: 129/255, green: 203/255, blue: 235/255, alpha: 100)
        infoDisplay.textColor = UIColor.white
        //totalCycle = historicalData.historicalEvent.count - 1
        totalCycle = questionArray.questionArray.count - 1
        let cellDate = tableView.cellForRow(at: [0, 0]) as! CellForTableView
        cellDate.dateCellLabel.textColor = UIColor.blue
        let cellEvent = tableView1.cellForRow(at: [0, 0]) as! CellForTableView
        cellEvent.displayGrayEventCell(cell: cellEvent)
        cellEvent.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)

    }
    
    @IBAction func eliminateEventAction(_ sender: Any) {
        var index = 0
        for n in 0 ... 6 {
            //if historicalData.historicalEvent[n].1 == 5 {
            if questionArray.questionArray[n].1 == 5 {
                index = n
            }
        }
        let cellEvent = tableView1.cellForRow(at: [0, index]) as! CellForTableView
        cellEvent.eventCellLabel.text = ""
        //historicalData.historicalEvent[index] = ("", 5)
        questionArray.questionArray[index] = ("", 5)
        totalAvailableCredit = totalAvailableCredit - 2
        creditAvailable.text = "Credit Available: \(totalAvailableCredit)"
// this button an only be used once (there is only one extra event)
        eliminateButton.isEnabled = false
        
    }
    
    @IBAction func tryAgainAction(_ sender: Any) {
        //historicalData = HistoricalData()
        questionArray = QuestionArray()
        questionArray = questionArray.rearangeForQuiz()
        for n in 0 ... 6 {
            let cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
            cellEvent.isHidden = false
            //cellEvent.eventCellLabel.text = historicalData.historicalEvent[n].0
            cellEvent.eventCellLabel.text = questionArray.questionArray[n].0
            cellEvent.displayGrayEventCell(cell: cellEvent)
            cellEvent.eventCellLabel.textColor = UIColor.blue
        }
        let displayButton = DisplayOutlet(eliminateButton: eliminateButton, tryAgainButton: tryAgainButton, showButton: showButton)
        displayButton.forTryAgain()
        resultMessageLabel.isHidden = true
        longPress.isEnabled = true
        counter = 51
        labelIsDropped = false
        timerProgressBar = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimerProgress), userInfo: nil, repeats: true)
        totalAvailableCredit = totalAvailableCredit - 2
        creditAvailable.text = "Credit Available: \(totalAvailableCredit)"

    }
    @IBAction func buyCreditAction(_ sender: Any) {
        let shake = Shake()
        let cellEvent = tableView1.cellForRow(at: [0, 1]) as! CellForTableView
        let shakeLabel = cellEvent.eventCellLabel
        shake.shakeViewVertical(vw: shakeLabel!)
        
    }
    
    @IBAction func showNextEventButton(_ sender: Any) {
        var n = 0
        var i = 0
        var cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
        for _ in 0 ... 6 {
            cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
            if cellEvent.eventCellLabel.text == "" {break}
            n = n + 1
        }
        for _ in 0 ... 6 {
            //if n == historicalData.historicalEvent[i].1 {break}
            if n == questionArray.questionArray[i].1 {break}
            i = i + 1
        }
        if n != i {swap(&questionArray.questionArray[i], &questionArray.questionArray[n])}
        if i != n + 1{swap(&questionArray.questionArray[i], &questionArray.questionArray[n + 1])}
        cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
        cellEvent.eventCellLabel.text = questionArray.questionArray[n].0
        cellEvent = tableView1.cellForRow(at: [0, i]) as! CellForTableView
        cellEvent.eventCellLabel.text = questionArray.questionArray[i].0
        cellEvent = tableView1.cellForRow(at: [0, n + 1]) as! CellForTableView
        cellEvent.eventCellLabel.text = questionArray.questionArray[n + 1].0

        

        
        
        totalAvailableCredit = totalAvailableCredit - 2
        creditAvailable.text = "Credit Available: \(totalAvailableCredit)"
        let checkResponse = CheckResponse(questionArray: questionArray, tableView1: tableView1, counter: counter, labelIsDropped: labelIsDropped)
        labelIsDropped = checkResponse.allAnswered()
        
    }
    
    func resultMessage() {
        timerProgressBar.invalidate()
        resultMessageLabel.isEnabled = true
        resultMessageLabel.isHidden = false
        longPress.isEnabled = false
    }

////////////////////////////////////////////////
// Logic for the LongPresse gesture and movement
/////////////////////////////////////////////////
    func longPressGestureRecognized(gesture: UILongPressGestureRecognizer) {
        var indexPath = NSIndexPath()
        let state: UIGestureRecognizerState = gesture.state
        let location: CGPoint = gesture.location(in: tableView1)
        let indexPathTry: NSIndexPath? = tableView1.indexPathForRow(at: location) as NSIndexPath?
        if let indexPathtemp = indexPathTry {
            indexPath = indexPathtemp
            indexPathSelected = indexPath as IndexPath
        }else{
            indexPath = indexPathSelected as NSIndexPath
        }
        
        switch state {
            
        case UIGestureRecognizerState.began:
            sourceIndexPath = indexPath;
            let cellEvent = tableView1.cellForRow(at: indexPath as IndexPath) as! CellForTableView
            cellEvent.displayGrayEventCell(cell: cellEvent)
            snapshot = customSnapshotFromView(inputView: cellEvent.eventCellLabel)
            
            var center = cellEvent.eventCellLabel.center
            snapshot?.center = center
            snapshot?.alpha = 0.0
            tableView1.addSubview(snapshot!)
            
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                center.y = location.y
                self.snapshot?.center = center
                self.snapshot?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.snapshot?.alpha = 0.98
                cellEvent.alpha = 0.0
            })
            
        case UIGestureRecognizerState.changed:
            var center: CGPoint = snapshot!.center
            center.y = location.y
            snapshot?.center = center
            // Is destination valid and is it different from source?
            if indexPath != sourceIndexPath {
                // ... update data source.
                
                // Here's where you move
                
                print("\(sourceIndexPath!.row),\(indexPath.row)")
                let tmp = questionArray.questionArray[sourceIndexPath!.row]
                
                
                questionArray.questionArray[sourceIndexPath!.row] = questionArray.questionArray[indexPath.row]
                questionArray.questionArray[indexPath.row] = tmp
                
                // items.exchangeObjectAtIndex(indexPath!.row, withObjectAtIndex: sourceIndexPath!.row)
                // ... move the rows.
                tableView1.moveRow(at: sourceIndexPath! as IndexPath, to: indexPath as IndexPath)
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
                
            }
        default:
            // Clean up.

            let checkResponse = CheckResponse(questionArray: questionArray, tableView1: tableView1, counter: counter, labelIsDropped: labelIsDropped)
            labelIsDropped = checkResponse.allAnswered()
    
            let cell = tableView1.cellForRow(at: indexPath as IndexPath)!
            cell.alpha = 0.0
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                self.snapshot?.center = cell.center
                self.snapshot?.transform = CGAffineTransform.identity
                self.snapshot?.alpha = 0.0
                // Undo fade out.
                cell.alpha = 1.0
                
            }, completion: { (finished) in
                
                self.sourceIndexPath = nil
                self.snapshot?.removeFromSuperview()
                self.snapshot = nil;
            })
            break
        }
    }
    
    // MARK: Helper
    func customSnapshotFromView(inputView: UIView) -> UIView {
        // Make an image from the input view.
        let cellEvent = tableView1.cellForRow(at: indexPathSelected as IndexPath) as! CellForTableView
        UIGraphicsBeginImageContextWithOptions(cellEvent.eventCellLabel.layer.bounds.size, false, 0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        // Create an image view.
        let snapshot = UIImageView(image: image)
        snapshot.layer.masksToBounds = false
        snapshot.layer.cornerRadius = 0.0
        snapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        snapshot.layer.shadowRadius = 5.0
        snapshot.layer.shadowOpacity = 0.2
        return snapshot
    }

}

extension UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 70 // adjust your size here
        return sizeThatFits
    }
}
