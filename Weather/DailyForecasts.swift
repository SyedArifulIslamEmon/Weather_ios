//
//  DailyForecastsDictionary.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import ObjectMapper

class DailyForecasts: Mappable{
    
    var date : String?
    var epochDate : Int?
    
    var temperature : Temperature?
    var day : DayNightIcon?
    var night : DayNightIcon?
   
    var sources : [String]?
    var mobileLink : String?
    var link : String?
    
    required init?(map: Map) {
        date <- map["Date"]
        epochDate <- map["EpochDate"]
        temperature <- map["temperature"]
        day <- map["Day"]
        night <- map["Night"]
        sources <- map["Sources"]
        mobileLink <- map["MobileLink"]
        link <- map["Link"]
    }
    
    func mapping(map: Map) {
        date <- map["Date"]
        epochDate <- map["EpochDate"]
        temperature <- map["Temperature"]
        day <- map["Day"]
        night <- map["Night"]
        sources <- map["Sources"]
        mobileLink <- map["MobileLink"]
        link <- map["Link"]
    }
}
