//
//  DateAndeventTableViewCell.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-14.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class DateAndeventTableViewCell: UITableViewCell {
    @IBOutlet weak var columnDate: UILabel!
    @IBOutlet weak var columnEventDescription: UILabel!
   
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        columnDate.numberOfLines = 0
        columnEventDescription.numberOfLines = 0
        columnDate.lineBreakMode = .byWordWrapping
        columnEventDescription.lineBreakMode = .byWordWrapping
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
