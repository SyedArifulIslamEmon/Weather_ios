//
//  WeatherCD+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 17/02/17.
//
//

import Foundation
import CoreData


extension WeatherCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherCD> {
        return NSFetchRequest<WeatherCD>(entityName: "WeatherCD");
    }

    @NSManaged public var dailyforecasts: DailyForecastsCD?
    @NSManaged public var headline: HeadlineCD?

}
