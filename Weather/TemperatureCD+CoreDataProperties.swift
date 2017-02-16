//
//  TemperatureCD+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 16/02/17.
//
//

import Foundation
import CoreData


extension TemperatureCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TemperatureCD> {
        return NSFetchRequest<TemperatureCD>(entityName: "TemperatureCD");
    }

    @NSManaged public var minimum: MinimumCD?
    @NSManaged public var maximum: MaximumCD?
    @NSManaged public var dailyForecasts: DailyForecastsCD?

}
