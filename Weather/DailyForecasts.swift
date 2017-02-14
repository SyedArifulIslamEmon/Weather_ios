//
//  DailyForecastsDictionary.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation

class DailyForecasts{
    
    var date : String?
    var epochDate : Int?
    
    var temperature : [Temperature]?
    var day : [DayNightIcon]?
    var night : [DayNightIcon]?
    
    var sources : [String]?
    var mobileLink : String?
    var link : String?
    
    init(date : String?, epochDate : Int?, temperature : [Temperature]?, day : [DayNightIcon]?, night : [DayNightIcon]?, sources : [String]?, mobileLink : String?, link : String?){
        
        self.date = date
        self.epochDate = epochDate
        self.temperature = temperature
        self.day = day
        self.night = night
        self.sources = sources
        self.mobileLink = mobileLink
        self.link = link
    }
}
