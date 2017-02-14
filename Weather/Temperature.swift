//
//  Temperature.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation

class Temperature{

    var maximumTemperature: [MinMaxTemperature]?
    var minimumTemperature: [MinMaxTemperature]?

    init(maximumTemperature: [MinMaxTemperature]?, minimumTemperature: [MinMaxTemperature]?){
    
        self.maximumTemperature = maximumTemperature
        self.minimumTemperature = minimumTemperature
    }
}
