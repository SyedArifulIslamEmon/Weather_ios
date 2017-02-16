//
//  DayNightIcon.swift
//  Weather
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import ObjectMapper

class DayNightIcon: Mappable{
    
    var icon: Int?
    var iconPhrase: String?
    
    required init?(map: Map) {
        icon <- map["Icon"]
        iconPhrase <- map["IconPhrase"]
    }
    
    func mapping(map: Map) {
        icon <- map["Icon"]
        iconPhrase <- map["IconPhrase"]
    }
}
