//
//  NightCD+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 16/02/17.
//
//

import Foundation
import CoreData


extension NightCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NightCD> {
        return NSFetchRequest<NightCD>(entityName: "NightCD");
    }

    @NSManaged public var icon: NSData?
    @NSManaged public var iconPhrase: NSData?
    @NSManaged public var dailyForecasts: DailyForecastsCD?

}
