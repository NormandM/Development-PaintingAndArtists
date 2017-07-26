//
//  CellForTableView.swift
//  DateTest3
//
//  Created by Normand Martin on 17-07-20.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class CellForTableView: UITableViewCell {
    @IBOutlet weak var eventCellLabel: UILabel!
    @IBOutlet weak var dateCellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
extension CellForTableView {
    func displayWhiteDateCell(cell: CellForTableView) {
        cell.dateCellLabel.numberOfLines = 0
        cell.dateCellLabel.lineBreakMode = .byWordWrapping
        cell.dateCellLabel.textColor = UIColor.white
    }
    func displayWhiteEventCell(cell: CellForTableView) {
        cell.eventCellLabel?.numberOfLines = 0
        cell.eventCellLabel?.lineBreakMode = .byWordWrapping
        cell.eventCellLabel?.textColor = UIColor.white
    }
    func displayGrayEventCell(cell: CellForTableView) {
        cell.eventCellLabel.textColor = UIColor.blue
        cell.eventCellLabel.layer.masksToBounds = true
        cell.eventCellLabel.layer.cornerRadius = 10.0
        cell.eventCellLabel.backgroundColor = UIColor.lightGray
    }
    func displayInvisibleEventCell(cell: CellForTableView) {
        cell.eventCellLabel.textColor = UIColor.clear
        cell.eventCellLabel.backgroundColor = UIColor.clear
    }


}
