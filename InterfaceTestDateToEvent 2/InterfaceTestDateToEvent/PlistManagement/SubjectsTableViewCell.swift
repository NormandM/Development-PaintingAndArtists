//
//  SubjectsTableViewCell.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-02-04.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
  
    var textTitle = UILabel()
    var iconeImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func icone(name: String, isFinished: Bool) -> UIView{
        let iconeName = name
        if let iconeImage = UIImage(named: iconeName){
            iconeImageView = UIImageView(image: iconeImage)
            let screenSize = ScreenSize()
            iconeImageView.frame = screenSize.identify().9!
            textTitle = screenSize.identify().10!
            if isFinished {
                textTitle.textColor = UIColor(red: 100/255, green: 112/255, blue: 108/255, alpha: 1.0)
            }else{
                textTitle.textColor = UIColor(displayP3Red: 147/255, green: 83/255, blue: 71/255, alpha: 1.0)
            }
            
        }
        return iconeImageView
    }
    func hideImage() {
        iconeImageView.isHidden = true
    }
    func showImage() {
        iconeImageView.isHidden = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

