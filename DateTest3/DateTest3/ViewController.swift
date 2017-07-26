//
//  ViewController.swift
//  DateTest3
//
//  Created by Normand Martin on 17-07-14.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var sourceIndexPath: NSIndexPath? = nil
    var snapshot: UIView? = nil
    var timer = Timer()
    var indexPathSelected = IndexPath()
    var timerProgressBar = Timer()
    var labelIsDropped: Bool = false
    var counter = 0
    var totalCycle = 0

    @IBOutlet weak var startTheQuiz: UIButton!
    @IBOutlet weak var timerProgress: UIProgressView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView1: UITableView!
    

    var historicalData = HistoricalData(historicalEvent: [("Big Bang", 0), ("Sun forms", 1), ("Earth forms", 2), ("Moon formes", 3), ("Beginning of life", 4), ("First Dinosaurs", 5), ("First Mammals", 6), ("", 7) ], historicalDate: [("13.8 Billions", 0), ("4.6 billions", 1), ("4.5 billions", 2), ("4.4 billion", 3), ("4.28 billion", 4), ("250 millions", 5), ("210 millions", 6), ("", 7)])
    
    let longPress: UILongPressGestureRecognizer = {
        let recognizer = UILongPressGestureRecognizer()
        return recognizer
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Start the Quiz when ready!"
        startTheQuiz.setTitle("Start the Quiz when ready!", for: .normal)
        self.tableView.separatorStyle = .none
        self.tableView1.separatorStyle = .none
        timerProgress.progress = 0.0
        longPress.addTarget(self, action:  #selector(longPressGestureRecognized(gesture:)))
        tableView1.addGestureRecognizer(longPress)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        var count:Int?
        
        if tableView == self.tableView {
            count = historicalData.historicalDate.count
        }
        
        if tableView == self.tableView1 {
            count =  historicalData.historicalEvent.count
        }
        
        return count!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:CellForTableView?
        
        if tableView == self.tableView {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! CellForTableView)
            cell?.dateCellLabel.text = historicalData.historicalDate[indexPath.row].0
            cell?.displayWhiteDateCell(cell: cell!)
        }
        
        if tableView == self.tableView1 {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath as IndexPath) as! CellForTableView)
            cell?.eventCellLabel.text = historicalData.historicalEvent[indexPath.row].0
            cell?.displayWhiteEventCell(cell: cell!)
        }
        
    return (cell)!
    }
    
    @IBAction func startQuiz(_ sender: Any) {
        self.title = "Memorize events and dates"
        totalCycle = historicalData.historicalEvent.count - 1
        let cellDate = tableView.cellForRow(at: [0, 0]) as! CellForTableView
        cellDate.dateCellLabel.textColor = UIColor.blue
        let cellEvent = tableView1.cellForRow(at: [0, 0]) as! CellForTableView
        cellEvent.displayGrayEventCell(cell: cellEvent)
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    func runTimedCode() {
        totalCycle = totalCycle - 1
        counter = counter + 1
        if totalCycle  > 0 {
            let cellDate = tableView.cellForRow(at: [0, counter]) as! CellForTableView
            cellDate.dateCellLabel.textColor = UIColor.blue
            let cellEvent = tableView1.cellForRow(at: [0, counter]) as! CellForTableView
            cellEvent.displayGrayEventCell(cell: cellEvent)

        }else{
            timer.invalidate()
            counter = 0
            timerProgressBar = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimerProgress), userInfo: nil, repeats: true)

            var n = 0
            for _ in historicalData.historicalEvent {
                let cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
                cellEvent.eventCellLabel.textColor = UIColor.white
                n = n + 1
            }
            n = 0
            historicalData.historicalEvent.removeLast()
            historicalData.shuffle()
            historicalData.historicalEvent.insert(("", 0), at: 0)
            self.title = "Choose event for each date"
            for event in historicalData.historicalEvent {
                let cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
                cellEvent.eventCellLabel.text = event.0
                cellEvent.eventCellLabel.textColor = UIColor.blue
                n = n + 1
            }
            let cellEvent = tableView1.cellForRow(at: [0, n - 1]) as! CellForTableView
            cellEvent.displayGrayEventCell(cell: cellEvent)
            n = 0
            for _ in historicalData.historicalDate {
                if n > 4{
                    let cellDate = tableView.cellForRow(at: [0, n]) as! CellForTableView
                    cellDate.dateCellLabel?.text = ""
                }
                n = n + 1
                
            }
        }
    }
    func runTimerProgress() {
        counter = counter + 1
        startTheQuiz.setTitle(String(51 - counter), for: .normal)
        let progress: Double = Double(counter)/50.0
        timerProgress.progress = Float(progress)
        if progress > 1.0 || labelIsDropped == true{
            timerProgressBar.invalidate()
            let finaltEvent = historicalData.historicalEvent.dropLast(4)
            let finalDate = historicalData.historicalDate.dropLast(4)
            var n = 0
            var responseIsGood: Bool = false
            for _ in finalDate {
                if finalDate[n].1 != finaltEvent[n].1{
                    print("Better luck next time")
                    break
                }else{
                    responseIsGood = true
                }
                n = n + 1
            }
            if responseIsGood {print("Bravo")}
            n = 0
            
            for n in 5 ... 7 {
                let cellEvent = tableView1.cellForRow(at: [0, n]) as! CellForTableView
                cellEvent.displayInvisibleEventCell(cell: cellEvent)
            }

            longPress.isEnabled = false

    
            print(finaltEvent)
            print(finalDate)
 
        }
    }
////////////////////////////////////////////////
// Logic for the LongPresse gesture and movement
/////////////////////////////////////////////////
    func longPressGestureRecognized(gesture: UILongPressGestureRecognizer) {
        var indexPath = NSIndexPath()
        let state: UIGestureRecognizerState = gesture.state;
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
                let tmp = historicalData.historicalEvent[sourceIndexPath!.row]
                
                
                historicalData.historicalEvent[sourceIndexPath!.row] = historicalData.historicalEvent[indexPath.row]
                historicalData.historicalEvent[indexPath.row] = tmp
                
                // items.exchangeObjectAtIndex(indexPath!.row, withObjectAtIndex: sourceIndexPath!.row)
                // ... move the rows.
                tableView1.moveRow(at: sourceIndexPath! as IndexPath, to: indexPath as IndexPath)
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
                
            }
        default:
            // Clean up.
            print("changed")
            if (historicalData.historicalEvent[0].0 != "" && historicalData.historicalEvent[1].0 != "" && historicalData.historicalEvent[2].0 != "" && historicalData.historicalEvent[3].0 != "" && historicalData.historicalEvent[4].0 != ""){
                labelIsDropped = true
            }else{
                labelIsDropped = false
            }
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
