//
//  CellForTableView.swift
//  MatchDateWithEvent
//
//  Created by Normand Martin on 17-08-22.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class CellForTableView: UITableViewCell {
    @IBOutlet weak var dateCellLabel: UILabel!
    @IBOutlet weak var eventCellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    func displayGreenEventCell(cell: CellForTableView) {
        cell.eventCellLabel.textColor = UIColor.blue
        cell.eventCellLabel.layer.masksToBounds = true
        cell.eventCellLabel.layer.cornerRadius = 10.0
        cell.eventCellLabel.backgroundColor = UIColor.green
    }
    func displayRedEventCell(cell: CellForTableView) {
        cell.eventCellLabel.textColor = UIColor.blue
        cell.eventCellLabel.layer.masksToBounds = true
        cell.eventCellLabel.layer.cornerRadius = 10.0
        cell.eventCellLabel.backgroundColor = UIColor.red
    }
    
}

