//
//  SubjectsTableViewCell.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-02-04.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    var diplomaImageView = UIImageView()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        let imageName = "mortarboard.png"
        let diplomaImage = UIImage(named: imageName)!
        diplomaImageView = UIImageView(image: diplomaImage)
        diplomaImageView.frame = CGRect(origin: CGPoint(x: 0, y: 0 ), size: CGSize(width: 50, height: 50))
    }
    func hideImage() {
        diplomaImageView.isHidden = true
    }
    func showImage() {
        diplomaImageView.isHidden = false
    }

//    func addingImage(indexPath: IndexPath, tableView: UITableView) {
//        let cell = tableView.cellForRow(at: indexPath) as! SubjectTableViewCell
//        cell.addSubview(diplomaImageView)
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

