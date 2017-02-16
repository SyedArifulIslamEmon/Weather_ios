//
//  DailyForecastsCD+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 16/02/17.
//
//

import Foundation
import CoreData


extension DailyForecastsCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyForecastsCD> {
        return NSFetchRequest<DailyForecastsCD>(entityName: "DailyForecastsCD");
    }

    @NSManaged public var date: NSData?
    @NSManaged public var epochDate: NSData?
    @NSManaged public var link: NSData?
    @NSManaged public var mobileLink: NSData?
    @NSManaged public var sources: NSData?
    @NSManaged public var day: DayCD?
    @NSManaged public var night: NightCD?
    @NSManaged public var temperature: TemperatureCD?

}
