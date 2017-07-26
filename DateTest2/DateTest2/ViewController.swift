//
//  ViewController.swift
//  DateTest2
//
//  Created by Normand Martin on 17-07-14.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var tableView1: UITableView!
    
    
    let longPress: UILongPressGestureRecognizer = {
        let recognizer = UILongPressGestureRecognizer()
        return recognizer
    }()
    
    
    
    
    
    /// A simple data structure to populate the table view.
    struct PreviewDetail {
        let title: String
        let preferredHeight: Double
    }
    
    var sampleData = [
        PreviewDetail(title: "Small", preferredHeight: 160.0),
        PreviewDetail(title: "Medium", preferredHeight: 320.0),
        PreviewDetail(title: "Large", preferredHeight: 0.0) // 0.0 to get the default height.
    ]
    
    let sampleData1 = [
        PreviewDetail(title: "One", preferredHeight: 160.0),
        PreviewDetail(title: "Two", preferredHeight: 320.0),
        PreviewDetail(title: "Three", preferredHeight: 0.0), // 0.0 to get the default height.
        PreviewDetail(title: "More", preferredHeight: 0.0) // 0.0 to get the default height.
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        
        
        longPress.addTarget(self, action: Selector(("longPressGestureRecognized:")))
        tableView.addGestureRecognizer(longPress)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        var count:Int?
        
        if tableView == self.tableView {
            count = sampleData.count
        }
        
        if tableView == self.tableView1 {
            count =  sampleData1.count
        }
        
        return count!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.tableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
            let previewDetail = sampleData[indexPath.row]
            cell!.textLabel!.text = previewDetail.title
            
        }
        
        if tableView == self.tableView1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath as IndexPath)
            let previewDetail = sampleData1[indexPath.row]
            cell!.textLabel!.text = previewDetail.title
            
        }
        
        
        
        return cell!
    }
    
    var sourceIndexPath: NSIndexPath? = nil
    var snapshot: UIView? = nil
    
    
    func longPressGestureRecognized(gesture: UILongPressGestureRecognizer) {
        let state: UIGestureRecognizerState = gesture.state;
        let location: CGPoint = gesture.location(in: tableView)
        let indexPath: NSIndexPath? = tableView.indexPathForRow(at: location)! as NSIndexPath
        if indexPath == nil {
            return
        }
        
        switch (state) {
            
        case UIGestureRecognizerState.began:
            sourceIndexPath = indexPath;
            let cell = tableView.cellForRow(at: indexPath! as IndexPath)!
            snapshot = customSnapshotFromView(inputView: cell)
            
            var center = cell.center
            snapshot?.center = center
            snapshot?.alpha = 0.0
            tableView.addSubview(snapshot!)
            
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                center.y = location.y
                self.snapshot?.center = center
                self.snapshot?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.snapshot?.alpha = 0.98
                cell.alpha = 0.0
            })
            
        case UIGestureRecognizerState.changed:
            var center: CGPoint = snapshot!.center
            center.y = location.y
            snapshot?.center = center
            
            // Is destination valid and is it different from source?
            if indexPath != sourceIndexPath {
                // ... update data source.
                
                // Here's where you move
                
                print("\(sourceIndexPath!.row),\(indexPath!.row)")
                let tmp = sampleData[sourceIndexPath!.row]
                
                
                sampleData[sourceIndexPath!.row] = sampleData[indexPath!.row]
                sampleData[indexPath!.row] = tmp
                
                // items.exchangeObjectAtIndex(indexPath!.row, withObjectAtIndex: sourceIndexPath!.row)
                // ... move the rows.
                tableView.moveRow(at: sourceIndexPath! as IndexPath, to: indexPath! as IndexPath)
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
            }
            
        default:
            // Clean up.
            let cell = tableView.cellForRow(at: indexPath! as IndexPath)!
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
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        // Create an image view.
        let snapshot = UIImageView(image: image)
        snapshot.layer.masksToBounds = false
        snapshot.layer.cornerRadius = 0.0
        snapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        snapshot.layer.shadowRadius = 5.0
        snapshot.layer.shadowOpacity = 0.4
        
        
        return snapshot
    }
    
    
    
    
    
}

