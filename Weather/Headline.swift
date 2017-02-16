//
//  HeadlineDictionary.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Headline: Mappable{

    var effectiveDate : String?
    var effectiveEpochDate : Int?
    var severity : String?
    var text : String?
    var category : String?
    var endDate : String?
    var endEpochDate : Int?
    var mobileLink : String?
    var link : String?

    required init?(map: Map) {
        effectiveDate <- map["EffectiveDate"]
        effectiveEpochDate <- map["EffectiveEpochDate"]
        severity <- map["Severity"]
        text <- map["Text"]
        category <- map["EffectiveDate"]
        endDate <- map["EndDate"]
        endEpochDate <- map["EndEpochDate"]
        mobileLink <- map["MobileLink"]
        link <- map["Link"]

    }
    
    func mapping(map: Map) {
        effectiveDate <- map["EffectiveDate"]
        effectiveEpochDate <- map["EffectiveEpochDate"]
        severity <- map["Severity"]
        text <- map["Text"]
        category <- map["EffectiveDate"]
        endDate <- map["EndDate"]
        endEpochDate <- map["EndEpochDate"]
        mobileLink <- map["MobileLink"]
        link <- map["Link"]
    }
}
