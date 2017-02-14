//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var lblWeekDays: UILabel!
    
    @IBOutlet var imgWeekDays: UIImageView!
    @IBOutlet var lblHighTemperatureWeekDays: UILabel!
    
    @IBOutlet var lblLowTemperatureWeekDays: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
