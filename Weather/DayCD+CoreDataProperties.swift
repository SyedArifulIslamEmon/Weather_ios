//
//  DayCD+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 16/02/17.
//
//

import Foundation
import CoreData


extension DayCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayCD> {
        return NSFetchRequest<DayCD>(entityName: "DayCD");
    }

    @NSManaged public var icon: NSData?
    @NSManaged public var iconPhrase: NSData?
    @NSManaged public var dailyForecasts: DailyForecastsCD?

}
