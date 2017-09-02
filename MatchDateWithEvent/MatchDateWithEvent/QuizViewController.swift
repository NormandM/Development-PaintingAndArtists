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
    var titleArray: [String] = []
    var sectionTotalArray: [[String]] = []


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
    var responseIsGood: Bool = false

    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBOutlet weak var creditAvailable: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var eliminateButton: UIButton!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var infoDisplay: UILabel!
    let headerLabelTableView = UILabel()
    let headerLabelTableView1 = UILabel()
    
    var tableCell = CellForTableView()


    
    let longPress: UILongPressGestureRecognizer = {
        let recognizer = UILongPressGestureRecognizer()
        return recognizer
    }()
    var startButton = UIButton()
    var nextButton = UIButton()
    var tryAgainOrNext = UIButton()
    var questionArray: QuestionArray?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        questionArray = QuestionArray(sectionDetail: sectionDetail)
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
        tryAgainOrNext = UIButton(frame: CGRect(origin: CGPoint(x: self.view.frame.width/2 - 100, y: self.view.frame.height/1.4), size: CGSize(width: 200, height: 50)))
        tryAgainOrNext.backgroundColor = UIColor(red: 129/255, green: 203/255, blue: 235/255, alpha: 100)
        tryAgainOrNext.addTarget(self, action: #selector(tryAgainOrNextAction(sender:)), for: .touchUpInside)

        tryAgainOrNext.titleLabel?.lineBreakMode = .byWordWrapping
        tryAgainOrNext.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        tryAgainOrNext.titleLabel?.textAlignment = .center
        tryAgainOrNext.layer.masksToBounds = true
        tryAgainOrNext.layer.cornerRadius = 10
        tryAgainOrNext.setTitleColor(UIColor.white, for: .normal)
        tryAgainOrNext.isEnabled = false
        tryAgainOrNext.isHidden = true
        self.navigationController?.view.addSubview(tryAgainOrNext)
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
        var count:Int?
        if tableView == self.tableView {
            count = questionArray?.dateArray.count
        }
        if tableView == self.tableView1 {
            count = questionArray?.questionArray.count
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
            cell?.dateCellLabel.text = questionArray?.dateArray[indexPath.row].0
            cell?.displayWhiteDateCell(cell: cell!)
        }
        
        if tableView == self.tableView1 {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath as IndexPath) as! CellForTableView)
            cell?.eventCellLabel.text = questionArray?.questionArray[indexPath.row].0
            
            cell?.displayWhiteEventCell(cell: cell!)
        }
        
        return (cell)!
    }

////////////////////////////////////////////////////////
//  Functions
///////////////////////////////////////////////////////
    // Timing of the display of the dates for the quiz
    func runTimedCode() {
        totalCycle = totalCycle - 1
        counter = counter + 1
        let questionTimer = QuestionTimer(tableView: tableView, tableView1: tableView1, totalCycle: totalCycle, counter: counter, questionArray: questionArray!)
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
        
        let checkResponse = CheckResponse(questionArray: questionArray!, tableView1: tableView1, counter: counter, labelIsDropped: labelIsDropped)
        responseIsGood = checkResponse.checkResponse()
        if responseIsGood && (progress < 0 || labelIsDropped == true){
            resultMessage()
            tryAgainOrNext.setTitle("Next Quiz", for: .normal)
        }else if responseIsGood == false && (progress < 0 || labelIsDropped == true){
            let displayButtons = DisplayOutlet(eliminateButton: eliminateButton, showButton: showButton, tryAgainOrNext: tryAgainOrNext)
            displayButtons.forWrongAnswer()
            resultMessage()
            tryAgainOrNext.setTitle("Try Again", for: .normal)
            
        }
        
    }


    func resultMessage() {
        timerProgressBar.invalidate()
        tryAgainOrNext.isEnabled = true
        tryAgainOrNext.isHidden = false
        longPress.isEnabled = false
    }
    
    func startNewQuiz() {
        counter = 0
        startButton.isHidden = true
        startButton.isEnabled = false
        headerLabelTableView.isHidden = false
        let buttons = DisplayOutlet(eliminateButton: eliminateButton, showButton: showButton, tryAgainOrNext: tryAgainOrNext)
        buttons.quizMode()
        infoDisplay.text = "Here comes the Dates!"
        infoDisplay.backgroundColor = UIColor(red: 129/255, green: 203/255, blue: 235/255, alpha: 100)
        infoDisplay.textColor = UIColor.white
        totalCycle = (questionArray?.questionArray.count)! - 1
        let cellEvent = tableCell.definedBy(tableView: tableView1, index: 0)
        cellEvent.displayGrayEventCell(cell: cellEvent)
        cellEvent.isHidden = true

    }
    

    
////////////////////////////////////////////////////////
// Buttons main storyBoard and programmed
///////////////////////////////////////////////////////
    func startButtonAction (sender: UIButton) {
        startNewQuiz()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    @IBAction func eliminateEventAction(_ sender: Any) {
        var index = 0
        for n in 0 ... 6 {
            if questionArray?.questionArray[n].1 == 5 {
                
                index = n
            }
        }
        let cellEvent = tableCell.definedBy(tableView: tableView1, index: index)
        cellEvent.eventCellLabel.text = ""
        questionArray?.questionArray[index] = ("", 5)
        totalAvailableCredit = totalAvailableCredit - 2
        creditAvailable.text = "Credit Available: \(totalAvailableCredit)"
        // this button an only be used once (there is only one extra event)
        eliminateButton.isEnabled = false
        
    }
    
    @IBAction func buyCreditAction(_ sender: Any) {
        let shake = Shake()
        let cellEvent = tableCell.definedBy(tableView: tableView1, index: 1)
        let shakeLabel = cellEvent.eventCellLabel
        shake.shakeViewVertical(vw: shakeLabel!)
        
    }
    
    @IBAction func showNextEventButton(_ sender: Any) {
        var n = 0
        var i = 0
        var j = 0
        var cellEvent = tableCell.definedBy(tableView: tableView1, index: n)

        for _ in 0 ... 6 {
            if questionArray?.questionArray[n].1 != n {break}
            n = n + 1
        }
        for _ in 0 ... 6 {
            if n == questionArray?.questionArray[i].1 {break}
            i = i + 1
        }
        if n != i {swap(&questionArray!.questionArray[i], &questionArray!.questionArray[n])}
        for _ in 0 ... 6 {
            if questionArray?.questionArray[j].0 == "" {break}
            j = j + 1
        }
        if j != n + 1  {swap(&questionArray!.questionArray[j], &questionArray!.questionArray[n + 1])}
        cellEvent = tableCell.definedBy(tableView: tableView1, index: n)
        let cellEventFrameN = cellEvent.frame
        let maxXcellEventN = cellEventFrameN.maxX
        let maxYcellEventN = cellEventFrameN.maxY
        cellEvent.eventCellLabel.text = questionArray?.questionArray[n].0

        
        cellEvent = tableCell.definedBy(tableView: tableView1, index: i)
        cellEvent.eventCellLabel.text = questionArray?.questionArray[i].0
        let cellEventFrameI = cellEvent.frame
        let maxXcellEventI = cellEventFrameI.maxX
        let maxYcellEventI = cellEventFrameI.maxY

        UIView.animate(withDuration: 2, animations: {
            cellEvent.transform = CGAffineTransform(translationX: 0, y: abs(maxYcellEventI - maxYcellEventN))
        })
        cellEvent = tableCell.definedBy(tableView: tableView1, index: j)
        cellEvent.eventCellLabel.text = questionArray?.questionArray[j].0
        cellEvent = tableCell.definedBy(tableView: tableView1, index: n + 1)
        cellEvent.eventCellLabel.text = questionArray?.questionArray[n + 1].0
    
        totalAvailableCredit = totalAvailableCredit - 2
        creditAvailable.text = "Credit Available: \(totalAvailableCredit)"
        let checkResponse = CheckResponse(questionArray: questionArray!, tableView1: tableView1, counter: counter, labelIsDropped: labelIsDropped)
        labelIsDropped = checkResponse.allAnswered()
        
    }
    func tryAgainOrNextAction (sender: UIButton) {
        longPress.isEnabled = true
        labelIsDropped = false
        if responseIsGood{
            var n = 0
            let arraySection = sectionTotalArray.flatMap { $0 }
            for section in arraySection{
                if section == sectionDetail {
                    sectionDetail = arraySection [n + 1]
                    break
                }
                n = n + 1
            }
            let historicalData = HistoricalData()
            pageTitle = historicalData.sectionHeaderTable[n]
            questionArray = QuestionArray(sectionDetail: sectionDetail)
            questionArray = questionArray?.rearangeForQuiz()
            startNewQuiz()
            for n in 0 ... 5 {
                let cellDate = tableCell.definedBy(tableView: tableView, index: n)
                let cellEvent = tableCell.definedBy(tableView: tableView1, index: n)
                cellDate.isHidden = true
                cellEvent.isHidden = true
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        }else{
            questionArray = questionArray?.rearangeForQuiz()
            
            for n in 0 ... 6 {
                let cellEvent = tableCell.definedBy(tableView: tableView1, index: n)
                cellEvent.isHidden = false
                cellEvent.eventCellLabel.text = questionArray?.questionArray[n].0
                cellEvent.displayGrayEventCell(cell: cellEvent)
                cellEvent.eventCellLabel.textColor = UIColor.blue
            }
            let displayButton = DisplayOutlet(eliminateButton: eliminateButton, showButton: showButton, tryAgainOrNext: tryAgainOrNext)
            displayButton.forTryAgain()
            tryAgainOrNext.isHidden = true
            longPress.isEnabled = true
            counter = 51
            labelIsDropped = false
            timerProgressBar = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimerProgress), userInfo: nil, repeats: true)
            totalAvailableCredit = totalAvailableCredit - 2
            creditAvailable.text = "Credit Available: \(totalAvailableCredit)"
        }
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
            
            UIView.animate(withDuration: 0.01, animations: { () -> Void in
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
                let tmp = questionArray?.questionArray[sourceIndexPath!.row]
                
                
                questionArray?.questionArray[sourceIndexPath!.row] = (questionArray?.questionArray[indexPath.row])!
                questionArray?.questionArray[indexPath.row] = tmp!
                
                // items.exchangeObjectAtIndex(indexPath!.row, withObjectAtIndex: sourceIndexPath!.row)
                // ... move the rows.
                tableView1.moveRow(at: sourceIndexPath! as IndexPath, to: indexPath as IndexPath)
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
                
            }
        default:
            // Clean up.
            
            let checkResponse = CheckResponse(questionArray: questionArray!, tableView1: tableView1, counter: counter, labelIsDropped: labelIsDropped)
            labelIsDropped = checkResponse.allAnswered()
            
            let cell = tableView1.cellForRow(at: indexPath as IndexPath)!
            cell.alpha = 0.0
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
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
        snapshot.layer.shadowOpacity = 0.5
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
