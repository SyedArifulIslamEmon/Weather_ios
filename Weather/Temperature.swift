//
//  Temperature.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import ObjectMapper

class Temperature: Mappable{

    var maximumTemperature: MinMaxTemperature?
    var minimumTemperature: MinMaxTemperature?
    
    required init?(map: Map) {
        maximumTemperature <- map["Maximum"]
        minimumTemperature <- map["Minimum"]
    }
    
    func mapping(map: Map) {
        maximumTemperature <- map["Maximum"]
        minimumTemperature <- map["Minimum"]
    }
}
