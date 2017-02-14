//
//  MinMaxTemperature.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation

class MinMaxTemperature{
    
    var value: Float?
    var unit: String?
    var unitType: Int?
    
    init(value: Float?, unit: String?, unitType: Int?){
        
        self.value = value
        self.unit = unit
        self.unitType = unitType
    }
}
