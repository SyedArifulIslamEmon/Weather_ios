//
//  MinimumCD+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 16/02/17.
//
//

import Foundation
import CoreData


extension MinimumCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MinimumCD> {
        return NSFetchRequest<MinimumCD>(entityName: "MinimumCD");
    }

    @NSManaged public var value: NSData?
    @NSManaged public var unit: NSData?
    @NSManaged public var unitType: NSData?
    @NSManaged public var temperature: TemperatureCD?

}
