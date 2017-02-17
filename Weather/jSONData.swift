//
//  Data.swift
//  Weather
//
//  Created by Sierra 4 on 15/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import ObjectMapper

class jSONData: Mappable{
    
    var headline: Headline?
    var dailyForecasts: [DailyForecasts]?
    
    required init?(map: Map) {
        headline <- map["Headline"]
        dailyForecasts <- map["DailyForecasts"]
    }
    
    func mapping(map: Map) {
        headline <- map["Headline"]
        dailyForecasts <- map["DailyForecasts"]
    }
}
