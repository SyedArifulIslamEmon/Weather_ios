//
//  MinMaxTemperature.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import ObjectMapper

class MinMaxTemperature: Mappable{
    
    var value: Float?
    var unit: String?
    var unitType: Int?
    
    required init?(map: Map) {
        value <- map["Value"]
        unit <- map["Unit"]
        unitType <- map["UnitType"]
    }
    
    func mapping(map: Map) {
        value <- map["Value"]
        unit <- map["Unit"]
        unitType <- map["UnitType"]
    }
}
