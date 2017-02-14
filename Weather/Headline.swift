//
//  HeadlineDictionary.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation

class Headline{

    var effectiveDate : String?
    var effectiveEpochDate : Int?
    var severity : String?
    var text : String?
    var category : String?
    var endDate : String?
    var endEpochDate : Int?
    var mobileLink : String?
    var link : String?

    init(effectiveDate : String?, effectiveEpochDate : Int?, severity : String?, text : String?, category : String?, endDate : String?, endEpochDate : Int?, mobileLink : String?, link : String?){
        self.effectiveDate = effectiveDate
        self.effectiveEpochDate = effectiveEpochDate
        self.severity = severity
        self.text = text
        self.category = category
        self.endDate = endDate
        self.endEpochDate = endEpochDate
        self.mobileLink = mobileLink
        self.link = link
    }
}
